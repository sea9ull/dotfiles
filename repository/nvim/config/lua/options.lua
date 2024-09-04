vim.opt.shortmess:append("c")
RUNTIME= os.getenv("HOME") .. "/.config/nvim"
-- ========================================
--  System Settings
-- ========================================

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = {"utf-8","cp932","iso-2022-jp","sjis","euc-jp"}
vim.opt.fileformats = {"unix","dos","mac"}

--disable vim default folding
--set nofoldenable
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 100
--set foldcolumn=1

-- sharing clipboard
-- #on ubuntu
vim.opt.clipboard=unnamedplus
-- #on otherUnix/Linux
--set clipboard+=unnamed,autoselect
vim.opt.undodir= RUNTIME .. '/undo'

-- 8進数を無効にする。<C-a>,<C-x>に影響する
vim.opt.nrformats:remove('octal')
-- キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
vim.opt.timeout = true
vim.opt.timeoutlen=1000
vim.opt.ttimeoutlen=100
-- 編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
vim.opt.hidden = true
-- history line capacity
vim.opt.history=3000
-- in join, non <Space> between japanese characters
vim.opt.formatoptions:remove('t')
vim.opt.formatoptions:append('mM')
-- Visual blockモードでフリーカーソルを有効にする
vim.opt.virtualedit="block"
-- カーソルキーで行末／行頭の移動可能に設定
vim.opt.whichwrap="b,s,[,],<,>"
-- バックスペースでインデントや改行を削除できるようにする
vim.opt.backspace={"indent","eol","start"}
--ambichar size
vim.opt.ambiwidth = "single"
-- set ambiwidth=double

vim.opt.title = true

-- not make  backupfile, swapfile
vim.opt.ttyfast = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.backupskip = {"/tmp/*", "private/tmp/*"}
vim.opt.swapfile = false

vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 2
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.smartindent = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.shell = "zsh"
vim.opt.signcolumn = "yes"
-- コマンドライン補完するときに強化されたものを使う
vim.opt.wildmenu = true

vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.termguicolors = false
vim.opt.pumblend = 5
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- =========================
-- Search
-- =========================
-- 検索の時に大文字小文字を区別しない
-- ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 検索時にファイルの最後まで行ったら最初に戻る
vim.opt.wrapscan = true
-- incremental search
vim.opt.incsearch = true
-- highlight search
vim.opt.hlsearch = true
-- w,bの移動で認識する文字
vim.opt.iskeyword="a-z,A-Z,48-57,_,.,-,>"
-- vimgrep をデフォルトのgrepとする場合internal
vim.opt.grepprg = "internal"
vim.opt.showmatch = true
vim.opt.matchtime=1

-- =========================
-- TAB
-- =========================
local tab_size = 4
vim.opt.expandtab = true
vim.opt.tabstop = tab_size
vim.opt.softtabstop = tab_size
vim.opt.shiftwidth = tab_size
vim.opt.shiftround = true
vim.opt.smarttab = true

vim.opt.autoindent = true
-- set smartindent
-- set nocindent
-- status line height
