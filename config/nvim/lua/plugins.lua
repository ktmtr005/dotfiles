if vim.g.vscode then
    return {
        {
            "numToStr/Comment.nvim",
            opts = {

            },
            lazy = false,
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
            "numToStr/Comment.nvim",
            opts = {

            },
            lazy = false,
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
        }
    }
end
