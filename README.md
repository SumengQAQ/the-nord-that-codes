# 🐍 Sumeng's NvChad 配置

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-green?logo=neovim&logoColor=white)](https://neovim.io/)
[![NvChad](https://img.shields.io/badge/NvChad-v2.5-blue)](https://nvchad.com/)
[![Python](https://img.shields.io/badge/Python-3.12+-blue?logo=python&logoColor=white)](https://www.python.org/)
[![Codeium](https://img.shields.io/badge/AI-Codeium-purple)](https://codeium.com/)
[![Made with ❤️](https://img.shields.io/badge/Made_with-❤️-ff69b4)](https://github.com/SumengQAQ)

## 📖 关于本配置

这是我 —— 一个**新媒体技术专业**（对，不是计算机系）的水课战神，从 LazyVim 难民一路折腾出来的 NvChad 配置。

**核心哲学：** 开箱即用，但不臃肿。只保留我真正用得到的东西。

**花絮：** 为了修好 Codeium 补全，我花了 **5 块钱** API 费和 AI 斗智斗勇。特此纪念。

## ✨ 特性

- 🎯 **针对 Python/C 优化**：LSP、格式化、调试开箱即用
- 🤖 **Codeium AI 补全**：免费的 GitHub Copilot 替代品
- 🎨 **Nord 主题**：护眼冷色调，配合 Oh My Posh 使用
- ⌨️ **纯键盘流**：Telescope 模糊查找 + LazyGit 可视化
- 🐞 **断点调试**：nvim-dap + debugpy，和 PyCharm 说再见
- 📁 **文件树**：nvim-tree，支持 Git 状态显示

## 🚀 快速开始

### 1. 备份你的旧配置

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

### 2. 克隆本仓库

```bash
git clone https://github.com/SumengQAQ/sumeng-nvim.git ~/.config/nvim
```

### 3. 启动 Neovim

```bash
nvim
```

首次启动会自动安装所有插件，等它跑完（约 2-3 分钟）。

### 4. 安装 LSP 服务器

进入 Neovim 后执行：

```vim
:Mason
```

安装以下 LSP：

- `pyright`（Python）
- `clangd`（C/C++）
- `lua-language-server`（Lua）

### 5. 配置 Codeium（可选）

去 [codeium.com](https://codeium.com) 注册，拿到 API Key，在终端执行：

```bash
mkdir -p ~/.config/codeium
echo '{"api_key": "你的API Key"}' > ~/.config/codeium/config.json
```

## ⌨️ 核心快捷键

### 文件与搜索

| 操作        | 快捷键       | 说明               |
| ----------- | ------------ | ------------------ |
| 找文件      | `<leader>ff` | Telescope 模糊查找 |
| 全局搜代码  | `<leader>sg` | live grep          |
| 文件树      | `<leader>e`  | 开关 nvim-tree     |
| 切换 Buffer | `<leader>fb` | 找已打开的文件     |

### 代码与补全

| 操作             | 快捷键       | 说明             |
| ---------------- | ------------ | ---------------- |
| 格式化代码       | `<leader>lf` | LSP 格式化       |
| 跳转定义         | `gd`         | go to definition |
| 重命名           | `<leader>cr` | LSP rename       |
| Codeium 接受补全 | `Tab`        | 灰色补全         |
| 手动触发 Codeium | `Ctrl+;`     | 没自动弹出时用   |

### Git（LazyGit）

| 操作          | 快捷键       | 说明              |
| ------------- | ------------ | ----------------- |
| 打开 LazyGit  | `<leader>gg` | 全功能 Git TUI    |
| 行内 Git 状态 | 自动显示     | 左侧绿色/红色竖条 |

### 调试（DAP）

| 操作     | 快捷键       | 说明        |
| -------- | ------------ | ----------- |
| 设置断点 | `<leader>db` | 光标所在行  |
| 启动调试 | `<leader>dc` | 选择 Python |
| 单步跳过 | `<leader>do` | step over   |
| 单步进入 | `<leader>di` | step into   |
| 查看变量 | `<leader>du` | DAP UI      |

## 📁 目录结构

```
~/.config/nvim/
├── init.lua                 # 入口
├── lazy-lock.json           # 插件版本锁定
├── lua/
│   ├── custom/
│   │   ├── plugins.lua      # 插件配置
│   │   ├── mappings.lua     # 快捷键
│   │   └── options.lua      # 编辑器选项
│   └── plugins/             # 单文件插件配置
│       ├── blink-cmp.lua    # 补全引擎
│       ├── lsp.lua          # LSP 配置
│       └── dap.lua          # 调试配置
└── README.md                # 本文件
```

## 🔧 依赖

确保你的系统装了以下工具：

- **Neovim** ≥ 0.10.0
- **Git**
- **ripgrep** (`sudo apt install ripgrep`)
- **fd** (`sudo apt install fd-find`)
- **Nerd Font**（推荐 JetBrains Mono Nerd Font）

## 🙋‍♂️ 关于作者

- **塑梦** / sumeng
- 新媒体技术专业（对，不是计算机系）
- 用 Neovim + LazyGit + Tailscale 写代码的水课战神
- 邮箱：sumengovocn@gmail.com

## ⭐ Star 历史

如果你觉得这个配置对你有帮助，点个 Star 让我知道有人在看！

[![Star History Chart](https://api.star-history.com/svg?repos=SumengQAQ/sumeng-nvim&type=Date)](https://star-history.com/#SumengQAQ/sumeng-nvim&Date)

## 📜 许可证

MIT License - 随便用，别告我。

---

**Made with ❤️, NvChad, and 5 块钱的 API 费.**
