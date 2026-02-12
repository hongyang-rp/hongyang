# 快速开始 (Quick Start)

## 安装依赖

```bash
# 创建虚拟环境
python3 -m venv venv

# 激活虚拟环境
source venv/bin/activate  # Linux/Mac
# 或
venv\Scripts\activate  # Windows

# 安装依赖
pip install -r source/requirements.txt
```

## 完整工作流示例

### 1. 编写中文文档

编辑 `source/index.rst` 或创建新的 `.rst` 文件：

```rst
欢迎来到我的技术博客
===================

这是我的第一篇博客文章。

.. toctree::
   :maxdepth: 2
   
   article1
   article2
```

### 2. 更新翻译文件

```bash
source venv/bin/activate  # 先激活虚拟环境
make update-en
```

这会在 `source/locale/en/LC_MESSAGES/` 生成 `.po` 文件。

### 3. 翻译成英文

打开 `source/locale/en/LC_MESSAGES/*.po` 文件，填写翻译：

```po
# 翻译前
msgid "欢迎来到我的技术博客"
msgstr ""

# 翻译后
msgid "欢迎来到我的技术博客"
msgstr "Welcome to My Tech Blog"
```

### 4. 构建文档

```bash
# 构建中文版
make html-zh

# 构建英文版  
make html-en

# 或同时构建两个版本
make html-all
```

### 5. 预览

用浏览器打开：
- 中文版: `build/html/zh_CN/index.html`
- 英文版: `build/html/en/index.html`

## 常用命令速查

```bash
# 激活虚拟环境（每次开始工作前）
source venv/bin/activate

# 写完/更新中文文档后
make update-en

# 翻译完成后，构建并预览
make html-all

# 只构建中文版
make html-zh

# 只构建英文版
make html-en
```

## 提示

1. **每次开始工作前记得激活虚拟环境**: `source venv/bin/activate`
2. **工作流程**: 写中文 → `make update-en` → 翻译 .po 文件 → `make html-all`
3. **AI 翻译**: 可以把 `.po` 文件中的 `msgid` 内容复制给 ChatGPT/Claude，让它帮你翻译后填入 `msgstr`
4. **批量翻译**: 可以使用 Poedit 等工具，或编写脚本调用 AI API 批量处理

更多详细信息请参考 `TRANSLATION_WORKFLOW.md`。
