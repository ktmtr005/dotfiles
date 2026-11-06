is_windows = vim.fn.has("win32") == 1

if vim.g.vscode then
    return {
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true
            -- use opts = {} for passing setup options
            -- this is equalent to setup({}) function
        },
        {
            "kylechui/nvim-surround",
            version = "*",
            event = "VeryLazy",
            config = function()
                require("nvim-surround").setup({
                    -- Configuration here, or leave empty to use defaults
                })
            end
        }
    }
else
    return {
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true
            -- use opts = {} for passing setup options
            -- this is equalent to setup({}) function
        },
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("nvim-tree").setup {}
            end,
        },
        {
            "ntk148v/habamax.nvim",
            dependencies = {
                "rktjmp/lush.nvim"
            }
        },
        {
            "kylechui/nvim-surround",
            version = "*",
            event = "VeryLazy",
            config = function()
                require("nvim-surround").setup({
                    -- Configuration here, or leave empty to use defaults
                })
            end
        },
        {
            "mason-org/mason.nvim",
            opts = {
                ensure_installed = {
                    "tinymist",
                },
            },
        },
        {
            "kaarmu/typst.vim",
            ft = "typst",
            lazy= false,
        },
        {
          'chomosuke/typst-preview.nvim',
          lazy = false, -- or ft = 'typst'
          version = '1.*',
          opts = {}, -- lazy.nvim will implicitly calls `setup {}`
        },
        {
            'lewis6991/gitsigns.nvim'
        }
    }
end
