return {
  -- 文件树
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = true,
        git_ignored = true,
        custom = { "node_modules" },
      },
    },
  },

  -- Markdown渲染
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    config = function()
      require("render-markdown").setup({})
    end,
  },

  -- 数据库工具
  {
    "tpope/vim-dadbod",
    ft = { "sql", "mysql", "pgsql" },
  },

  {
    "kristijanhusak/vim-dadbod-ui",
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
    opts = {},
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
      local dap = require("dap")
      
      -- Python调试适配器
      dap.adapters.python = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
        args = { "-m", "debugpy.adapter" },
      }

      -- C/C++调试适配器 (需要安装codelldb包)
      dap.adapters.codelldb = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb",
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
            return vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
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
    config = function()
      require("dapui").setup()
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
      require("nvim-autopairs").setup({})
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
      require("neotest").setup({
        adapters = {
          require("neotest-python"),
          require("neotest-jest"),
        },
      })
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
        enabled = true,
        show_start = true,
        show_end = true,
      },
      exclude = {
        filetypes = {
          "dashboard",
          "nvdash",
          "lazy",
          "help",
          "terminal",
        },
      },
    },
  },

  -- 单词高亮
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({
        delay = 200,  -- 延迟200ms后高亮
        under_cursor = true,  -- 光标下的单词
        providers = { "lsp", "treesitter", "regex" },
        filetypes_denylist = {
          "dashboard", "nvdash", "neo-tree", "trouble",
          "terminal", "TelescopePrompt", "NvimTree",
        },
      })
    end,
  },

  -- 美化通知
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      
      -- 设置notify为默认通知系统
      vim.notify = notify
      
      notify.setup({
        stages = "fade_in_slide_out",  -- 动画效果
        timeout = 3000,  -- 显示3秒
        background_colour = "#2E3440",  -- Nord背景色
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
      })
    end,
  },

  -- ========== 阶段三美化插件：动画和过渡效果 ==========

  -- 窗口动画效果
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup({
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
          easing = "in_out_sine"
        },
      })
    end,
  },

  -- 平滑滚动
  {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup({
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
      })

      -- 自定义滚动动画（更平滑）
      local t = {}
      t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '350'}}
      t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '350'}}
      t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '500'}}
      t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '500'}}
      t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
      t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
      t['zt']    = {'zt', {'250'}}
      t['zz']    = {'zz', {'250'}}
      t['zb']    = {'zb', {'250'}}

      require('neoscroll.config').set_mappings(t)
    end,
  },

  -- 光标移动动画
  {
    "gen740/SmoothCursor.nvim",
    config = function()
      require('smoothcursor').setup({
        autostart = true,
        cursor = "",  -- 自定义光标形状
        texthl = "SmoothCursor",  -- 高亮组
        linehl = nil,
        type = "default",
        fancy = {
          enable = true,
          head = { cursor = '▷', texthl = 'SmoothCursor', linehl = nil },
          body = {
            { cursor = '󰝥', texthl = 'SmoothCursor' },
            { cursor = '󰝥', texthl = 'SmoothCursor' },
            { cursor = '󰝥', texthl = 'SmoothCursor' },
          },
          tail = { cursor = nil, texthl = 'SmoothCursor' }
        },
        flyin_effect = "bottom",
        speed = 25,
        intervals = 35,
        priority = 10,
        timeout = 3000,
        threshold = 3,
        disable_float_win = false,
        enabled_filetypes = nil,
        disabled_filetypes = { "neo-tree", "dashboard", "nvdash" },
      })
    end,
  },

  -- 光标行动画（闪烁效果）
  {
    "xiyaowong/nvim-cursorword",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      pcall(function()
        require('nvim-cursorword').setup({
          hlgroup = "CursorWord",
          timeout = 500,
        })
      end)
    end,
  },

  -- 浮动窗口动画
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },

  -- ========== 阶段四美化插件：主题增强 ==========

  -- 彩虹括号
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local rainbow_delimiters = require('rainbow-delimiters')

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          -- Nord主题颜色
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow', 
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end,
  },

  -- Codeium AI 补全
  {
    "Exafunction/codeium.nvim",
    event = { "BufReadPost", "BufNewFile" },  -- 打开文件时自动加载
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        enable_chat = false,
      })
    end,
  },
}