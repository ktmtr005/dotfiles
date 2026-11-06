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
        },
        {
          'saghen/blink.cmp',
          -- optional: provides snippets for the snippet source
          dependencies = { 'rafamadriz/friendly-snippets' },

          -- use a release tag to download pre-built binaries
          version = '1.*',
          -- AND/OR build from source
          -- build = 'cargo build --release',
          -- If you use nix, you can build from source with:
          -- build = 'nix run .#build-plugin',

          ---@module 'blink.cmp'
          ---@type blink.cmp.Config
          opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'default' },

            appearance = {
              -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
              -- Adjusts spacing to ensure icons are aligned
              nerd_font_variant = 'mono'
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
              default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
          },
          opts_extend = { "sources.default" }
        }
    }
end
