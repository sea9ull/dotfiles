-- dependency lazy.nivm
-- yay -S nvim-lazy

-- -- ### it's bootstrap ###
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath, })
-- end

-- :Lazy sync     - install & update
-- :Lazy install
-- :Lazy update
-- :Lazy build
-- :Lazy check    - check loaded
local lsp_filetypes = {'rust'}

require("lazy").setup({
    -- ### Monokai Color Scheme ###
    -- local palette = monokai.classic
    -- local palette = monokai.pro
    -- local palette = monokai.ristretto
    -- -- ========= Colors ========
    -- --   brown white grey black
    -- --   pink green aqua yellow
    -- --   orange purple red
    -- -- =========================
    {
        'tanvirtin/monokai.nvim',
        config = function()
            local monokai = require('monokai')
            local palette = monokai.soda
            monokai.setup {
                palette = palette,
                custom_hlgroups = {
                    Normal       = {fg = palette.white, bg = 'NONE'},
                    CursorLineNr = {fg = palette.orange,bg = 'NONE'},
                    LineNr       = {fg = palette.base5, bg = 'NONE'},
                    Folded       = {fg = palette.grey , bg = 'NONE'},
                    SignColumn   = {fg = palette.white, bg = 'NONE'},
                    StatusLine   = {fg = palette.aqua , bg = 'NONE'},
                    StatusLineNC = {fg = "NONE" , bg = 'NONE'},
                    Terminal     = {fg = palette.white, bg = 'NONE'},
                    StatuslineNormalAccent = { fg = palette.green,  bg = 'none' },
                    StatuslineInsertAccent = { fg = palette.pink, bg = 'none' },
                    StatuslineVisualAccent = { fg = palette.purple,  bg = 'none' },
                    StatuslineConfirmAccent = { fg = palette.orange, bg = 'none' },
                    StatuslineTerminalAccent = { fg = palette.green, bg = 'none' },
                    StatuslineMiscAccent = { fg = palette.grey, bg = 'none' },
                },
            }
        end,
    },
    {
        "kylechui/nvim-surround",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        event = "VeryLazy",
        dependencies = { {'nvim-lua/plenary.nvim'} },
        config = require("plugin/telescope"),
    },
    -- =====================
    --     LSP Setting
    -- =====================
    {
        'williamboman/mason.nvim',
        lazy = true,
        cmd = {
          "Mason", "MasonInstall", "MasonUninstall",
          "MasonUninstallAll", "MasonLog", "MasonUpdate",
        },
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("mason").setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = true,
        ft = lsp_filetypes,
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
        },
        config = require("plugin/mason-lspconfig"),
    },
    {
        'hrsh7th/nvim-cmp',
        lazy = true,
        ft = lsp_filetypes,
        config = require("plugin/nvim-cmp"),
    },
    {
        'dart-lang/dart-vim-plugin',
        lazy = true,
        ft = {'dart'}
    },
    -- =====================
    --    AI Settings
    -- =====================
    {
        "nomnivore/ollama.nvim",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        -- All the user commands added by the plugin
        cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

        keys = {
            -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
            {
              "<leader>a",
              ":<c-u>lua require('ollama').prompt()<cr>",
              desc = "ollama prompt",
              mode = { "n", "v" },
            },

            -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
            {
                "<leader>o",
                ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
                desc = "ollama Generate Code",
                mode = { "n", "v" },
            },
        },

        ---@type Ollama.Config
        opts = {
            model = "qwen2.5-coder",
            url = "http://127.0.0.1:11434",
            serve = {
                on_start = false,
                command = "ollama",
                args = { "serve" },
                stop_command = "pkill",
                stop_args = { "-SIGTERM", "ollama" },
            },
            -- View the actual default prompts in ./lua/ollama/prompts.lua
            prompts = {
                Sample_Prompt = {
                    prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
                    input_label = "> ",
                    model = "qwen2.5-coder",
                    action = "display",
                }
            }
        }
    },
    -- {
    --     "monkoose/neocodeium",
    --     lazy = true,
    --     event = "VeryLazy",
    --     dependencies = {
    --         "hrsh7th/nvim-cmp",
    --     },
    --     config = function()
    --         local neocodeium = require("neocodeium")
    --         neocodeium.setup()
    --         vim.keymap.set("i", "<leader>a", neocodeium.accept)
    --     end,
    -- },
})
