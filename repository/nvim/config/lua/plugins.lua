-- dependency packer.nvim
-- yay -S nvim-packer-git

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
    use { 'wbthomason/packer.nvim', opt = true }

    -- use { 'tanvirtin/monokai.nvim',
    --     config = function()
    --         local monokai = require('monokai')
    --         local palette = monokai.soda
    --         -- local palette = monokai.classic
    --         -- local palette = monokai.pro
    --         -- local palette = monokai.ristretto
    --         -- -- ========= Colors ========
    --         -- --   brown white grey black
    --         -- --   pink green aqua yellow
    --         -- --   orange purple red
    --         -- -- =========================
    --         monokai.setup {
    --             palette = palette,
    --             custom_hlgroups = {
    --                 Normal       = {fg = palette.white, bg = 'NONE'},
    --                 CursorLineNr = {fg = palette.orange,bg = 'NONE'},
    --                 LineNr       = {fg = palette.base5, bg = 'NONE'},
    --                 Folded       = {fg = palette.grey , bg = 'NONE'},
    --                 SignColumn   = {fg = palette.white, bg = 'NONE'},
    --                 StatusLine   = {fg = palette.aqua , bg = 'NONE'},
    --                 StatusLineNC = {fg = palette.grey , bg = 'NONE'},
    --                 Terminal     = {fg = palette.white, bg = 'NONE'},
    --             },
    --         }
    --     end,
    -- }
end)
