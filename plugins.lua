local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "c",
        "cpp",
        "cmake",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "yaml"
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function ()
        return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
       ensure_installed = {
         "clangd",
         "clang-format",
         "codelldb",
         "black",
         "debugpy",
         "mypy",
         "ruff",
         "pyright",
         "rust-analyzer"
       },
     },
   },
   {
       "rust-lang/rust.vim",
        ft = "rust",
        init = function ()
            vim.g.rustfmt_autosave = 1
        end
   },
   {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = function ()
            return require "custom.configs.rust-tools"
        end,
        config = function (_, opts)
            require("rust-tools").setup(opts)
        end
   },
   {
        "saecki/crates.nvim",
        dependencies = "hrsh7th/nvim-cmp",
        ft = {"rust", "toml"},
        config = function (_, opts)
            local crates = require("crates")
            crates.setup(opts)
            crates.show()
        end,
        opts = {
            null_ls = {
                enabled = true,
                name = "crates.nvim",
            },
        },
   },
   {
        "hrsh7th/nvim-cmp",
        opts = function ()
            local M = require "plugins.configs.cmp"
            table.insert(M.sources, {name = "crates"})
            return M
        end,
   },
   {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function ()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function ()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function ()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function ()
                dapui.close()
            end
        end
   },
   {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
   },
   {
        "mfussenegger/nvim-dap",
        config = function (_, _)
            require("core.utils").load_mappings("dap")
        end
   },
   {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function (_, opts)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end,
   },
   {
        "simrat39/symbols-outline.nvim",
        lazy = false,
        config = function ()
            require("symbols-outline").setup()
        end
   },
   {
       "christoomey/vim-tmux-navigator",
       lazy = false,
   },
   {
       "kdheepak/lazygit.nvim",
       event = "VeryLazy",
       dependencies =  {
           "nvim-telescope/telescope.nvim",
           "nvim-lua/plenary.nvim"
       },
       config = function()
           require("telescope").load_extension("lazygit")
       end,
   },
   {
       "echasnovski/mini.animate",
       version = '*',
       lazy = false,
       config = function ()
            require("mini.animate").setup()
       end,
   },
   {
       "kylechui/nvim-surround",
       version = "*", -- Use for stability; omit to use `main` branch for the latest features
       event = "VeryLazy",
       config = function()
           require("nvim-surround").setup()
       end
   },
}

return plugins
