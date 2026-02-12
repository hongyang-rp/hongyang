# 中英双语支持配置总结

## ✅ 已完成的配置

### 1. 核心配置
- ✅ 修改了 `source/conf.py`，设置中文为默认语言 (`language = 'zh_CN'`)
- ✅ 启用了国际化支持 (i18n)
- ✅ 配置了翻译文件路径 (`locale_dirs`)

### 2. 依赖管理
- ✅ 在 `source/requirements.txt` 中添加了 `sphinx-intl`
- ✅ 移除了不兼容的 `imghdr-lts` 依赖

### 3. 构建工具
- ✅ 扩展了 `Makefile`，添加了以下便捷命令：
  - `make update-en` - 更新英文翻译文件
  - `make html-zh` - 构建中文版本
  - `make html-en` - 构建英文版本  
  - `make html-all` - 构建所有语言版本
  - `make init-en` - 首次初始化英文翻译
  - `make gettext` - 生成翻译模板

### 4. 翻译基础设施
- ✅ 创建了 `source/locale/` 目录结构
- ✅ 生成了初始的英文翻译文件 (`source/locale/en/LC_MESSAGES/index.po`)

### 5. 文档
- ✅ 创建了 `TRANSLATION_WORKFLOW.md` - 详细的工作流程说明
- ✅ 创建了 `QUICKSTART.md` - 快速入门指南
- ✅ 更新了 `.gitignore`，忽略虚拟环境和临时文件

## 📂 目录结构

```
hongyang-rp.github.io/
├── source/
│   ├── conf.py                    # ✅ 已配置 i18n
│   ├── requirements.txt           # ✅ 已添加 sphinx-intl
│   ├── index.rst                  # 中文源文档
│   └── locale/                    # ✅ 翻译文件目录
│       └── en/                    # 英文翻译
│           └── LC_MESSAGES/
│               └── index.po       # ✅ 待填写的翻译
├── build/
│   └── html/
│       ├── zh_CN/                 # 中文版输出
│       └── en/                    # 英文版输出
├── Makefile                       # ✅ 已添加翻译命令
├── QUICKSTART.md                  # ✅ 快速入门
├── TRANSLATION_WORKFLOW.md        # ✅ 详细工作流程
└── venv/                          # Python 虚拟环境
```

## 🚀 你的工作流程

### 日常写作流程
```bash
# 1. 激活虚拟环境
source venv/bin/activate

# 2. 编写/修改中文 .rst 文档
vim source/index.rst

# 3. 更新翻译模板
make update-en

# 4. 翻译 .po 文件
# 打开 source/locale/en/LC_MESSAGES/*.po
# 将 msgid 的中文内容翻译后填入 msgstr

# 5. 构建预览
make html-all

# 6. 在浏览器中查看
# build/html/zh_CN/index.html
# build/html/en/index.html
```

## 🤖 AI 翻译建议

### 方法 1: 手动复制粘贴
1. 打开 `.po` 文件
2. 复制所有 `msgid` 内容
3. 让 ChatGPT/Claude 翻译
4. 粘贴回对应的 `msgstr`

### 方法 2: 使用 Poedit
- 下载 [Poedit](https://poedit.net/)
- 可集成翻译服务
- 提供友好的图形界面

### 方法 3: 编写自动化脚本
```python
# 示例：使用 OpenAI API 批量翻译
import polib
import openai

po = polib.pofile('source/locale/en/LC_MESSAGES/index.po')
for entry in po:
    if not entry.msgstr:
        # 调用 AI API 翻译
        entry.msgstr = translate_with_ai(entry.msgid)
po.save()
```

## ⚠️ 注意事项

1. **虚拟环境**: 每次工作前记得 `source venv/bin/activate`
2. **Git 提交**: 
   - ✅ 需要提交: `.po` 文件（保存翻译）
   - ❌ 不要提交: `venv/`, `build/`, `source/locale/pot/`（已在 .gitignore）
3. **翻译更新**: 每次修改中文文档后，运行 `make update-en` 同步翻译文件
4. **源语言是中文**: 始终在 `.rst` 中用中文编写，英文只存在于 `.po` 文件

## 📝 下一步

现在你可以：
1. 开始用中文编写文档内容
2. 使用 `make update-en` 生成翻译模板
3. 用 AI 工具翻译 `.po` 文件
4. 用 `make html-all` 构建双语网站

祝写作愉快！ 🎉
