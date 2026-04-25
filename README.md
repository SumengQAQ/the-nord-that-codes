<p align="center">
  <img src="https://img.shields.io/badge/NvChad-v3-7c3aed?style=for-the-badge&logo=neovim&logoColor=white" alt="NvChad">
  <img src="https://img.shields.io/badge/Theme-Nord-88C0D0?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9IiM4OEMwRDAiIHN0cm9rZS13aWR0aD0iMiI+PHBhdGggZD0iTTEyIDJMMiA3bDEwIDUgMTAtNS0xMC01eiIvPjxwYXRoIGQ9Ik0yIDE3bDEwIDUgMTAtNSIvPjxwYXRoIGQ9Ik0yIDEybDEwIDUgMTAtNSIvPjwvc3ZnPg==" alt="Nord">
  <img src="https://img.shields.io/badge/WSL-Ready-4FAA5E?style=for-the-badge&logo=linux&logoColor=white" alt="WSL">
</p>

<h1 align="center">❄  Nord.nvim</h1>

<p align="center">
  <b>vibe coding 的最佳拍档 · 我的 Neovim 配置 · 你的下一把瑞士军刀</b>
</p>

<br>

<p align="center">
  <code>基于 NvChad，专注 Nord 主题 ，专为 WSL + Windows 开发者打造</code>
</p>

<br>

## 🌊 我们的故事

这不是一份严谨的生产级配置，而是一个大学生用 **vibe coding** 折腾出来的成果，用心打磨的每一个细节：从自动切换中英文输入法的手感，到光标拖影划过屏幕的那一抹丝滑，再到彩虹括号在 Nord 蓝调中层层绽放。

如果你也喜欢在终端里折腾、在代码中找感觉，或许你能在这里找到共鸣。

> _"Not the best config, but the vibiest one."_

<br>

## ✨ 灵魂亮点

|                           |                                               |
| ------------------------- | --------------------------------------------- |
| 🎨 **Nord 美学**          | 冷静的北极蓝，从头到脚统一配色                |
| 🪟 **Windows 肌肉记忆**   | Ctrl+C/V/X/Z/S/A 无缝衔接（WSL 亲儿子）       |
| 🤖 **双 AI 加持**         | AI 聊天 + Codeium 自动补全，双厨狂喜          |
| 🌀 **丝滑动画**           | 光标拖影、平滑滚动、窗口动画…… 能动的绝不静态 |
| 🌈 **彩虹括号**           | Nord 专属配色，层层嵌套一眼清                 |
| 🔤 **零切换烦恼**         | Insert 自动切英文，回到 Normal 恢复中文输入法 |
| 🎯 **调试一站式**         | DAP + UI + Python，F5 体验不再是 IDE 的专利   |
| 🗄️ **数据库就在编辑器里** | vim-dadbod，查表改数据不用切窗口              |

<br>

## 📦 已集成的能力

### 🤖 AI

| 插件              | 作用                               |
| ----------------- | ---------------------------------- |
| **CodeCompanion** | AI 聊天 / 行内提示 / Actions       |
| **Codeium**       | 智能自动补全                       |

### 🐛 调试 (DAP)

| 插件                | 作用                |
| ------------------- | ------------------- |
| **nvim-dap**        | 调试适配器核心      |
| **nvim-dap-ui**     | 可视化调试面板      |
| **nvim-dap-python** | Python 调试开箱即用 |

支持 **Python** 和 **C/C++ (codelldb)** 调试。

### 🔧 工程工具

| 类别        | 技术栈                                                              |
| ----------- | ------------------------------------------------------------------- |
| **Git**     | lazygit + diffview + undotree + telescope git                       |
| **Test**    | neotest (Python pytest + Jest)                                      |
| **LSP**     | pyright, clangd, tsserver, eslint, tailwindcss, jsonls, html, cssls |
| **Format**  | ruff (120行宽) + clang-format (120行宽) + prettierd (120行宽)       |
| **DB**      | vim-dadbod + dadbod-ui                                              |
| **Outline** | outline.nvim                                                        |

### 🎨 视觉美化

| 插件                   | 效果                 |
| ---------------------- | -------------------- |
| **smear-cursor.nvim**  | 光标拖影，如墨迹流淌 |
| **SmoothCursor.nvim**  | 箭头光标 + 粒子拖尾  |
| **neoscroll.nvim**     | 平滑滚动，告别硬跳   |
| **mini.animate**       | 窗口开合、滚动动画   |
| **windows.nvim**       | 窗口分割弹性动画     |
| **rainbow-delimiters** | Nord 六色括号彩虹    |
| **indent-blankline**   | 缩进指引线           |
| **mini.indentscope**   | 缩进范围动态高亮     |
| **nvim-notify**        | 弹出式通知替代       |
| **flare.nvim**         | 光标跳转高亮追踪     |
| **vim-illuminate**     | 同名单词自动高亮     |
| **colorful-winsep**    | 多彩窗口分隔线       |

### 📝 编辑体验

| 插件                     | 作用                     |
| ------------------------ | ------------------------ |
| **Comment.nvim**         | 智能注释切换             |
| **nvim-autopairs**       | 自动补全括号             |
| **nvim-ts-autotag**      | JSX/HTML 自动补全标签    |
| **nvim-cursorword**      | 光标下单词下划线高亮     |
| **todo-comments.nvim**   | TODO/FIX/HACK 高亮与管理 |
| **fusen.nvim**           | 便签工具，随手记         |
| **render-markdown.nvim** | Markdown 实时渲染        |
| **mermaid-cli**          | Mermaid 图片渲染         |

### 🧩 实用增强

| 插件                     | 作用                       |
| ------------------------ | -------------------------- |
| **telescope-frecency**   | 按频率排序文件搜索         |
| **im-select.nvim**       | 中英文输入法自动切换 (WSL) |
| **nvim-lint (eslint_d)** | JS/TS 实时 lint            |
| **venv-lsp.nvim**        | 自动检测 Python 虚拟环境   |

<br>

## 🚀 快速上手

### 前置要求

- Neovim >= 0.10
- [NvChad](https://github.com/NvChad/NvChad)
- （WSL）`im-select.exe` 放在 `C:\Windows\System32\`
- （WSL）安装 `lazygit`、`prettierd`

### 安装

```bash
git clone https://github.com/sumeng/nvim-config ~/.config/nvim
nvim --headless "+Lazy! sync" +qa
```

<br>

## ⌨️ 快捷键速查

### 🤖 AI

| 按键         | 功能             |
| ------------ | ---------------- |
| `<leader>aa` | AI Actions 菜单  |
| `<leader>ac` | AI 对话面板      |
| `<leader>ai` | 选中代码行内提示 |

### 🐛 调试

| 按键         | 功能         |
| ------------ | ------------ |
| `<leader>du` | 开关调试面板 |
| `<leader>dc` | 继续运行     |
| `<leader>do` | 单步跳过     |
| `<leader>di` | 单步进入     |
| `<leader>dj` | 单步跳出     |
| `<leader>dt` | 切换断点     |
| `<leader>dl` | 列出断点     |

### 🗂️ Git

| 按键         | 功能         |
| ------------ | ------------ |
| `<leader>gg` | Lazygit      |
| `<leader>gd` | Diffview     |
| `<leader>gs` | Git Status   |
| `<leader>gc` | Git Commits  |
| `<leader>gb` | Git Branches |
| `<leader>gl` | Git Log      |

### ✏️ 编辑 (Windows 风格)

| 按键         | 功能              |
| ------------ | ----------------- |
| `<C-s>`      | 保存              |
| `<C-z>`      | 撤销              |
| `<C-y>`      | 重做              |
| `<C-c>`      | 复制 (系统剪贴板) |
| `<C-x>`      | 剪切 (系统剪贴板) |
| `<C-v>`      | 粘贴 (系统剪贴板) |
| `<C-a>`      | 全选              |
| `<C-d>`      | 删除整行          |
| `<leader>er` | 重命名符号        |

### 🧪 测试

| 按键         | 功能             |
| ------------ | ---------------- |
| `<leader>tr` | 运行光标处测试   |
| `<leader>tf` | 运行当前文件测试 |
| `<leader>ts` | 开关测试面板     |

### ⚡ 常用

| 按键         | 功能                   |
| ------------ | ---------------------- |
| `<leader>o`  | 代码大纲               |
| `<leader>u`  | Undo 时间线            |
| `<leader>r`  | 运行脚本 (Python/C/JS) |
| `<leader>na` | 添加便签               |
| `<leader>ct` | 查找 TODO 注释         |
| `<leader>m`  | 生成.png 图片          |

<br>

## 📸 截图
![](https://private-user-images.githubusercontent.com/171399158/583709012-9d873d55-13c0-422f-8330-f634b1e08002.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NzcwOTA1MTcsIm5iZiI6MTc3NzA5MDIxNywicGF0aCI6Ii8xNzEzOTkxNTgvNTgzNzA5MDEyLTlkODczZDU1LTEzYzAtNDIyZi04MzMwLWY2MzRiMWUwODAwMi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjYwNDI1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI2MDQyNVQwNDEwMTdaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1mYmFjMDg1YzcwYjgyMDU5MDdlZjgwOTNjZDZmZjc2Yzg5MGMwYzMxMTc4MzFmZTVlZTE4N2YxZDdiMDAxZjU2JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZyZXNwb25zZS1jb250ZW50LXR5cGU9aW1hZ2UlMkZwbmcifQ.s1qv4VZQjbabv9J40BwQoKNc81b71qRuRzOHS5zI3wo)
![](https://private-user-images.githubusercontent.com/171399158/583709014-bbb44cb2-e63e-47a2-934a-105a64f56fbc.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NzcwOTA1MTcsIm5iZiI6MTc3NzA5MDIxNywicGF0aCI6Ii8xNzEzOTkxNTgvNTgzNzA5MDE0LWJiYjQ0Y2IyLWU2M2UtNDdhMi05MzRhLTEwNWE2NGY1NmZiYy5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjYwNDI1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI2MDQyNVQwNDEwMTdaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT0yZWI0MDZkN2VkNWJhNjczNmVjMTYzMGZlZGYyM2M5YjcwOTdlYjlmMDk4N2Q1ZGExMGUzODQ0MGMxZDk2MjU0JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZyZXNwb25zZS1jb250ZW50LXR5cGU9aW1hZ2UlMkZwbmcifQ.5P-6j7oqcc4rmA3oSXUqAbOjkNnn9CYjh_1L4tdC8D4)
![](https://private-user-images.githubusercontent.com/171399158/583709013-9131c6a8-99de-4cec-ad3b-77a04f6ca7c4.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NzcwOTA1MTcsIm5iZiI6MTc3NzA5MDIxNywicGF0aCI6Ii8xNzEzOTkxNTgvNTgzNzA5MDEzLTkxMzFjNmE4LTk5ZGUtNGNlYy1hZDNiLTc3YTA0ZjZjYTdjNC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjYwNDI1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI2MDQyNVQwNDEwMTdaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1hNDgxZGY2MzRjMTdiMGVmMWE1NjY0YjFiZWYxOTVjMTdkOWFjMWQ2MjMwMGY0OThiYTc3Zjc1MmE2Y2E2ZmUxJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZyZXNwb25zZS1jb250ZW50LXR5cGU9aW1hZ2UlMkZwbmcifQ.dljjCGg6sxkfJ50-UH-C0Nv4QkJofjFej2idyNIeEGI)
<br>

## 📜 LICENSE

MIT © SumengQAQ

---

<p align="center">
  <sub>Built with ❤️ and vibe coding · 在终端里找到属于你的 flow</sub>
</p>
