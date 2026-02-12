# 中英双语文档工作流程

## 概述
本仓库使用 Sphinx 支持中英双语文档。默认源语言是**中文**，翻译目标语言是**英文**。

## 工作流程

### 1. 编写中文文档
在 `source/` 目录下用中文编写 `.rst` 文件。这是你的主要工作内容。

### 2. 生成翻译模板
当你写完或更新中文文档后，运行：
```bash
make update-en
```
这会生成/更新 `source/locale/en/LC_MESSAGES/` 目录下的 `.po` 文件。

### 3. 翻译成英文
打开 `source/locale/en/LC_MESSAGES/` 目录下的 `.po` 文件，你会看到类似这样的结构：

```po
#: ../../index.rst:6
msgid "欢迎来到我的博客"
msgstr ""
```

使用 AI 翻译工具（如 ChatGPT、DeepL 等）将中文翻译成英文，填入 `msgstr` 中：

```po
#: ../../index.rst:6
msgid "欢迎来到我的博客"
msgstr "Welcome to My Blog"
```

**提示**: 你可以使用专门的 PO 编辑工具如 Poedit，或者批量处理工具。

### 4. 构建文档

构建中文版：
```bash
make html-zh
```
输出在 `build/html/zh_CN/`

构建英文版：
```bash
make html-en
```
输出在 `build/html/en/`

构建所有语言：
```bash
make html-all
```

### 5. 预览
在浏览器中打开：
- 中文版: `build/html/zh_CN/index.html`
- 英文版: `build/html/en/index.html`

## 常用命令

| 命令 | 说明 |
|------|------|
| `make update-en` | 更新英文翻译文件（提取最新的中文内容） |
| `make html-zh` | 构建中文版本 |
| `make html-en` | 构建英文版本 |
| `make html-all` | 构建所有语言版本 |

## 首次设置
如果是第一次设置英文翻译，运行：
```bash
make init-en
```

## 目录结构
```
source/
├── conf.py                    # Sphinx 配置
├── index.rst                  # 中文源文档
├── locale/                    # 翻译文件目录
│   ├── pot/                   # 翻译模板（自动生成）
│   └── en/                    # 英文翻译
│       └── LC_MESSAGES/
│           └── *.po           # 待翻译/已翻译的文件
└── ...

build/
├── html/
│   ├── zh_CN/                 # 中文版网站
│   └── en/                    # 英文版网站
```

## AI 翻译建议

### 使用命令行工具
你可以编写脚本自动调用 AI API 翻译 `.po` 文件。

### 使用在线工具
1. 复制 `.po` 文件中的 `msgid` 内容
2. 使用 ChatGPT/Claude/DeepL 翻译
3. 粘贴回 `msgstr`

### 使用 Poedit
Poedit 支持集成翻译服务，可以半自动化翻译流程。

## 注意事项
1. 始终先编写/修改中文文档
2. 每次修改中文后记得运行 `make update-en` 更新翻译文件
3. `.po` 文件应该提交到 Git，这样翻译内容会被保存
4. 不要直接修改 `locale/pot/` 目录中的文件，它们是自动生成的
