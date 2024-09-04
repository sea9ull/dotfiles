-- ========================================
--   Keymaps
-- ========================================
--
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap
keymap("", "<Space>", "<Nop>", opts)

--Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- 括弧の補完
keymap('i', '{<Space>', '{}<Left>', opts)
keymap('i', '[<Space>', '[]<Left>', opts)
keymap('i', '(<Space>', '()<Left>', opts)
keymap('i', '{<Return>', '{}<Left><CR><ESC><S-o><Tab>', opts)
keymap('i', '[<Return>', '[]<Left><CR><ESC><S-o><Tab>', opts)
keymap('i', '(<Return>', '()<Left><CR><ESC><S-o><Tab>', opts)
keymap('i', '\"<Space>', '\"\"<Left>', opts)
keymap('i', '\'<Space>', '\'\'<Left>', opts)
keymap('i', '\"<Return>', '\"\"<Left><CR><ESC><S-o><Tab>', opts)
keymap('i', '\'<Return>', '\'\'<Left><CR><ESC><S-o><Tab>', opts)
keymap('v', '{', 'zdi{<C-R>z}<ESC>', opts)
keymap('v', '[', 'zdi[<C-R>z]<ESC>', opts)
keymap('v', '(', 'zdi(<C-R>z)<ESC>', opts)
keymap('v', '\"', 'zdi\"<C-R>z\"<ESC>', opts)
keymap('v', '\'', 'zdi\'<C-R>z\'<ESC>', opts)

-- Split Window
keymap('n', '<silent> <C-W>\\', ':vs<CR>', opts)
keymap('n', '<silent> <C-W>-', ':split<CR>', opts)

--ヤンクの復元
keymap('n', 'PP', '\"0p', opts)

-- ヘルプ検索
-- keymap('n', '<F1>', 'K', opts)

-- 現在開いているvimスクリプトファイルを実行
keymap('n', '<F8>', ':source %<CR>', opts)
-- 強制全保存終了を無効化
keymap('n', 'ZZ', '<Nop>', opts)
keymap('n', 'ZQ', '<Nop>', opts)
keymap('n', '<C-Space>', '<Nop>', opts)
keymap('n', 'Q', ':help', opts)
-- カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p>
-- キーボードマクロには物理行移動を推奨
-- h l は行末、行頭を超えることが可能に設定(whichwrap)
keymap('n', '<Down>', 'gj', opts)
keymap('n', '<Up>',  'gk', opts)
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)
keymap('n', 'h', '<Left>zv', opts)
keymap('n', 'l', '<Right>zv', opts)

keymap('n', '<silent> <S-Left>' , ':5wincmd <<CR>', opts)
keymap('n', '<silent> <S-Right>', ':5wincmd ><CR>', opts)
keymap('n', '<silent> <S-Up>'   , ':5wincmd -<CR>', opts)
keymap('n', '<silent> <S-Down>' , ':5wincmd +<CR>', opts)

-- command Keybind help index.txt
-- command Molo colorscheme molokai
-- command Jelly colorscheme jellybeans
-- command Light set background=light
-- command Dark set background=dark

keymap('n', '<Leader>j', ':bnext<CR>', opts)
keymap('n', '<Leader>k', ':bprev<CR>', opts)
keymap('n', '<Leader>h', 'gT', opts)
keymap('n', '<Leader>l', 'gt', opts)
keymap('n', '<Leader>g', ':tabnew<CR>', opts)
keymap('n', '<Leader><BS>', ':q<CR>', opts)
keymap('n', '<Leader>/', ':Keybind<CR>', opts)
