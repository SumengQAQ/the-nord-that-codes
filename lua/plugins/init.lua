return {
  -- 文件树
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    opts = {
      filters = {
        dotfiles = true,
        git_ignored = true,
        custom = { "node_modules" },
      },
      view = {
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.o.columns
            local screen_h = vim.o.lines
            return {
              relative = "editor",
              width = math.floor(screen_w * 0.25),
              height = math.floor(screen_h * 0.8),
              row = math.floor(screen_h * 0.1),
              col = 0,
              border = "rounded",
            }
          end,
        },
      },
    },
  },

  -- Markdown渲染
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    config = function()
      require("render-markdown").setup {}
    end,
  },

  -- 数据库工具
  {
    "tpope/vim-dadbod",
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = "tpope/vim-dadbod",
    cmd = { "DBUI", "DBUIToggle" },
    config = function()
      vim.g.db_ui = {
        show_schema_await_columns = false,
      }
    end,
  },

  -- 便签工具
  {
    "walkersumida/fusen.nvim",
    event = "VimEnter",
    opts = {},
  },

  -- 代码大纲
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      outline_window = {
        width = 21,
        position = "right",
      },
    },
  },

  -- 自动补全
  {
    "hrsh7th/nvim-cmp",
    opts = require "custom.configs.cmp",
  },

  -- 代码格式化
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = require "configs.conform",
  },

  -- LSP配置
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Python虚拟环境检测
  {
    "jglasovic/venv-lsp.nvim",
    config = function()
      require("venv-lsp").setup()
    end,
  },

  -- 异步库
  {
    "nvim-neotest/nvim-nio",
  },

  -- 调试工具
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"

      -- Python调试适配器
      dap.adapters.python = {
        type = "executable",
        command = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python",
        args = { "-m", "debugpy.adapter" },
      }

      -- C/C++调试适配器 (需要安装codelldb包)
      dap.adapters.codelldb = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath "data" .. "/mason/packages/codelldb/codelldb",
          args = { "--port", "${port}" },
        },
      }

      -- Python调试配置
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "调试当前文件",
          program = "${file}",
          pythonPath = function()
            return vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python"
          end,
        },
      }

      -- C语言调试配置
      dap.configurations.c = {
        {
          name = "调试C程序",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("可执行文件路径: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
        {
          name = "调试当前C文件",
          type = "codelldb",
          request = "launch",
          program = "${fileDirname}/${fileBasenameNoExtension}",
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }

      -- C++调试配置 (复用C的配置)
      dap.configurations.cpp = dap.configurations.c
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dapui = require "dapui"
      dapui.setup {
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.40 },
              { id = "stacks", size = 0.30 },
              { id = "watches", size = 0.15 },
              { id = "breakpoints", size = 0.15 },
            },
            size = 0.22,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 1.0 },
            },
            size = 0.20,
            position = "bottom",
          },
        },
        controls = {
          element = "repl",
          enabled = true,
          icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "↻",
            terminate = "",
          },
        },
        floating = {
          max_height = 0.5,
          max_width = 0.4,
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
          options = {
            focusable = true,
          },
        },
      }
    end,
  },

  -- ========== 以下是新增的插件 ==========

  -- TypeScript支持
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  -- ESLint集成
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lint").linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }
    end,
  },

  -- 自动补全括号
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },

  -- 自动补全HTML/JSX标签
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- 注释工具
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },

  -- 颜色高亮
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  -- 测试框架
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-python",
          require "neotest-jest",
        },
      }
    end,
  },

  -- Jest测试适配器
  {
    "nvim-neotest/neotest-jest",
    dependencies = "nvim-neotest/neotest",
  },

  -- Python测试适配器
  {
    "nvim-neotest/neotest-python",
    dependencies = "nvim-neotest/neotest",
  },

  -- ========== 阶段二美化插件 ==========

  -- 图标增强
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },

  -- 缩进指南线 (v3版本)
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
      },
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = {
          "lazy",
          "help",
          "terminal",
        },
      },
    },
  },

  -- 缩进作用域动画 (独立于 indent-blankline)
  {
    "echasnovski/mini.indentscope",
    event = "BufReadPost",
    version = false,
    config = function()
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#88C0D0" })
      require("mini.indentscope").setup {
        draw = {
          delay = 30,
          animation = require("mini.indentscope").gen_animation.linear { duration = 25, unit = "step" },
          priority = 200,
        },
        symbol = "│",
        options = {
          border = "both",
          indent_at_cursor = true,
        },
      }
    end,
  },

  -- 光标跳转高亮追踪 (替代 specs.nvim，兼容 Neovim 0.11+)
  {
    "stonelasley/flare.nvim",
    event = "CursorMoved",
    config = function()
      require("flare").setup {
        enabled = true,
        x_threshold = 10, -- 水平跳转超过10列触发
        y_threshold = 10, -- 垂直跳转超过10行触发
        fade = true, -- 启用淡出动画
        timeout = 200, -- 淡出时间(ms)
        hl_group = "CursorLine", -- 高亮样式
      }
    end,
  },

  -- 单词高亮
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure {
        delay = 200, -- 延迟200ms后高亮
        under_cursor = true, -- 光标下的单词
        providers = { "lsp", "treesitter", "regex" },
        filetypes_denylist = {
          "neo-tree",
          "trouble",
          "terminal",
          "TelescopePrompt",
          "NvimTree",
        },
      }
    end,
  },

  -- 美化通知
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require "notify"

      -- 设置notify为默认通知系统
      vim.notify = notify

      notify.setup {
        stages = "fade_in_slide_out", -- 动画效果
        timeout = 3000, -- 显示3秒
        background_colour = "#2E3440", -- Nord背景色
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
        level = vim.log.levels.INFO,
        render = "default",
        top_down = true,
      }
    end,
  },

  -- ========== 阶段三美化插件：动画和过渡效果 ==========

  -- 窗口动画效果
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require("windows").setup {
        autowidth = {
          enable = false,
          winwidth = 50,
          filetype = { help = 2 },
        },
        ignore = {
          buftype = { "quickfix" },
          filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
        },
        animation = {
          enable = true,
          duration = 300,
          fps = 60,
          easing = "in_out_sine",
        },
      }
    end,
  },

  -- 平滑滚动
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {
        -- 隐藏滚动映射
        mappings = {},
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing_function = "quadratic",
        pre_hook = nil,
        post_hook = nil,
        performance_mode = false,
      }

      -- 自定义滚动动画（更平滑）
      local t = {}
      t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "350" } }
      t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "350" } }
      t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "500" } }
      t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "500" } }
      t["<C-y>"] = { "scroll", { "-0.10", "false", "100" } }
      t["<C-e>"] = { "scroll", { "0.10", "false", "100" } }
      t["zt"] = { "zt", { "250" } }
      t["zz"] = { "zz", { "250" } }
      t["zb"] = { "zb", { "250" } }

      require("neoscroll.config").set_mappings(t)
    end,
  },

  -- 光标移动动画
  {
    "gen740/SmoothCursor.nvim",
    config = function()
      require("smoothcursor").setup {
        autostart = true,
        cursor = "", -- 自定义光标形状
        texthl = "SmoothCursor", -- 高亮组
        linehl = nil,
        type = "default",
        fancy = {
          enable = true,
          head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil },
          body = {
            { cursor = "󰝥", texthl = "SmoothCursor" },
            { cursor = "󰝥", texthl = "SmoothCursor" },
            { cursor = "󰝥", texthl = "SmoothCursor" },
          },
          tail = { cursor = nil, texthl = "SmoothCursor" },
        },
        flyin_effect = "bottom",
        speed = 25,
        intervals = 35,
        priority = 10,
        timeout = 3000,
        threshold = 3,
        disable_float_win = false,
        enabled_filetypes = nil,
        disabled_filetypes = { "neo-tree" },
      }
    end,
  },

  -- 光标拖影效果 (smear-cursor)
  {
    "sphamba/smear-cursor.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      smear_between_buffers = true,
      hide_target_hack = true,
      cursor_color = "none",
      smear_to_cmd = true,
    },
  },

  -- 迷你动画 (mini.animate) - 禁用cursor避免与smear-cursor冲突
  {
    "nvim-mini/mini.animate",
    version = false,
    config = function()
      require("mini.animate").setup {
        cursor = {
          enable = false, -- 禁用！因为smear-cursor已经处理光标动画
        },
        scroll = {
          enable = true,
          timing = require("mini.animate").gen_timing.linear {
            duration = 250,
            unit = "total",
          },
        },
        resize = {
          enable = true,
          timing = require("mini.animate").gen_timing.linear {
            duration = 200,
            unit = "total",
          },
        },
        open = {
          enable = true,
          timing = require("mini.animate").gen_timing.linear {
            duration = 250,
            unit = "total",
          },
        },
        close = {
          enable = true,
          timing = require("mini.animate").gen_timing.linear {
            duration = 200,
            unit = "total",
          },
        },
      }
    end,
  },

  -- 光标行动画（闪烁效果）
  {
    "xiyaowong/nvim-cursorword",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      pcall(function()
        require("nvim-cursorword").setup {
          hlgroup = "CursorWord",
          timeout = 500,
        }
      end)
    end,
  },

  -- 浮动窗口动画
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },

  -- CodeCompanion AI 聊天
  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionChat", "CodeCompanionCmd" },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionActions<CR>", desc = "AI Actions" },
      { "<leader>ac", "<cmd>CodeCompanionChat<CR>", desc = "AI Chat" },
      { "<leader>ai", ":'<,'>CodeCompanion<CR>", desc = "AI Inline", mode = "v" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup {
        adapters = {
          http = {
            deepseek = function()
              return require("codecompanion.adapters").extend("deepseek", {
                env = {
                  api_key = "DEEPSEEK_API_KEY",
                },
                schema = {
                  model = {
                    default = "deepseek-chat",
                  },
                },
              })
            end,
          },
        },
        interactions = {
          chat = {
            adapter = "deepseek",
          },
          inline = {
            adapter = "deepseek",
          },
        },
      }
    end,
  },

  -- Telescope 按使用频率排序
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },

  -- Undo 树形可视化
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "undo tree" },
    },
  },

  -- Git Diff 可视化
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "git diff view" },
    },
  },

  -- ========== 阶段四美化插件：主题增强 ==========

  -- 彩虹括号
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
    config = function()
      local nord = {
        red = "#BF616A",
        orange = "#D08770",
        yellow = "#EBCB8B",
        green = "#A3BE8C",
        cyan = "#88C0D0",
        blue = "#81A1C1",
        violet = "#B48EAD",
      }
      local hl_groups = {
        RainbowDelimiterRed = { fg = nord.cyan },
        RainbowDelimiterYellow = { fg = nord.yellow },
        RainbowDelimiterBlue = { fg = nord.blue },
        RainbowDelimiterOrange = { fg = nord.orange },
        RainbowDelimiterGreen = { fg = nord.green },
        RainbowDelimiterViolet = { fg = nord.violet },
      }
      for name, opts in pairs(hl_groups) do
        vim.api.nvim_set_hl(0, name, opts)
      end

      vim.g.rainbow_delimiters = {
        strategy = { [""] = "rainbow-delimiters.strategy.global", vim = "rainbow-delimiters.strategy.local" },
        query = { [""] = "rainbow-delimiters", lua = "rainbow-blocks" },
        priority = { [""] = 110, lua = 210 },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
        },
      }
    end,
  },

  -- Codeium AI 补全
  {
    "Exafunction/codeium.nvim",
    event = { "BufReadPost", "BufNewFile" }, -- 打开文件时自动加载
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {
        enable_chat = false,
      }
    end,
  },

  -- Lazygit 整合
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterAuthor",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "lazygit" },
    },
  },

  -- TODO 注释高亮和管理
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("todo-comments").setup {
        signs = true, -- 在行号列显示图标
        sign_priority = 8,
        keywords = {
          FIX = {
            icon = " ", -- 图标
            color = "error", -- 颜色
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- 替代词
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        highlight = {
          multiline = true, -- 多行注释
          multiline_pattern = "^.", -- 模式
          multiline_context = 10, -- 上下文行数
          before = "", -- 高亮前字符
          keyword = "wide", -- "fg", "bg", "wide", "wide_bg"
          after = "fg", -- "fg", "bg", "wide"
          pattern = [[.*<(KEYWORDS)\s*:]], -- 匹配模式
          comments_only = true, -- 只高亮注释中的TODO
          max_line_len = 400, -- 最大行长度
          exclude = {}, -- 排除的文件类型
        },
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
        },
        search = {
          command = "rg", -- 使用的搜索命令
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          pattern = [[\b(KEYWORDS):]], -- 搜索模式
        },
      }
    end,
  },

  -- ========== 启动页 ==========
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {
        theme = "hyper",
        disable_move = true,
        change_to_vcs_root = true,
        shortcut_type = "letter",
        hide = {
          statusline = true,
          tabline = true,
          winbar = true,
        },
        config = {
          header = {
            "  ██████   █████                        █████ ",
            " ░░██████ ░░███                        ░░███  ",
            "  ░███░███ ░███   ██████  ████████   ███████  ",
            "  ░███░░███░███  ███░░███░░███░░███ ███░░███  ",
            "  ░███ ░░██████ ░███ ░███ ░███ ░░░ ░███ ░███  ",
            "  ░███  ░░█████ ░███ ░███ ░███     ░███ ░███  ",
            "  █████  ░░█████░░██████  █████    ░░████████ ",
            " ░░░░░    ░░░░░  ░░░░░░  ░░░░░      ░░░░░░░░  ",
            "",
            os.date "%Y-%m-%d %H:%M",
          },
          week_header = {
            enable = false,
          },
          shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            { desc = " Files", group = "Label", action = "Telescope find_files", key = "f" },
            { desc = " Recent", group = "Number", action = "Telescope oldfiles", key = "r" },
            { desc = "󰈭 Word", group = "String", action = "Telescope live_grep", key = "w" },
            { desc = " Config", group = "DiagnosticHint", action = "e $MYVIMRC", key = "c" },
            { desc = "󰑓 Quit", group = "Special", action = "qa", key = "q" },
          },
          footer = { "", "https://github.com/SumengQAQ/the-nord-that-codes" },
        },
      }

      local nord = {
        cyan   = "#88C0D0",
        blue   = "#81A1C1",
        gray   = "#4C566A",
        white  = "#D8DEE9",
        green  = "#A3BE8C",
        yellow = "#EBCB8B",
        red    = "#BF616A",
        purple = "#B48EAD",
        orange = "#D08770",
      }

      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = nord.cyan })
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = nord.gray })
      vim.api.nvim_set_hl(0, "DashboardMruTitle", { fg = nord.yellow })
      vim.api.nvim_set_hl(0, "DashboardMruIcon", { fg = nord.blue })
      vim.api.nvim_set_hl(0, "DashboardFiles", { fg = nord.white })
      vim.api.nvim_set_hl(0, "DashboardShortCutIcon", { fg = nord.green })
      vim.api.nvim_set_hl(0, "DashboardProjectTitle", { fg = nord.purple })
      vim.api.nvim_set_hl(0, "DashboardProjectTitleIcon", { fg = nord.orange })
      vim.api.nvim_set_hl(0, "DashboardProjectIcon", { fg = nord.blue })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dashboard",
        callback = function()
          vim.bo.bufhidden = "wipe"
          vim.wo.cursorline = false
          vim.wo.cursorcolumn = false
          vim.wo.number = false
          vim.wo.relativenumber = false
          pcall(vim.api.nvim_set_option_value, "scrollbind", false, { scope = "local" })
          vim.keymap.set("n", "<ScrollWheelDown>", "<Nop>", { buffer = true })
          vim.keymap.set("n", "<ScrollWheelUp>", "<Nop>", { buffer = true })
        end,
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  -- ========== 中英文输入法自动切换 (WSL + Windows 输入法) ==========
  {
    "keaising/im-select.nvim",
    event = { "InsertEnter", "InsertLeave" },
    config = function()
      -- WSL 中通过 im-select.exe 切换输入法
      -- 需要先下载 im-select.exe 放到 Windows PATH 中
      -- 下载地址: https://github.com/daipeihust/im-select/raw/master/win64/im-select.exe
      -- 放在 C:\Windows\System32\im-select.exe
      require("im_select").setup {
        default_im_select = "1033", -- 英文
        default_command = "im-select.exe", -- WSL 可直接调用 Windows exe
      }
    end,
  },
}
