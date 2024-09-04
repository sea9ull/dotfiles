-- =========================
--        Appearance
-- =========================

-- not show splash message
vim.opt.shortmess:append("I")
-- non beep
vim.opt.errorbells = false
vim.opt.visualbell = false

-- show column number
vim.opt.number = true
vim.opt.relativenumber = false
-- vim.opt.numberwidth = 4
vim.opt.ruler = true
vim.opt.cursorline = true
-- hide tab bar
vim.opt.showtabline = 0

-- 括弧の対応表示時間
-- C indent settings
vim.opt.cinoptions:append(':0')
vim.opt.title = true
-- show command in status
vim.opt.titlestring='%t'
vim.opt.showcmd = true
-- command line height
vim.opt.cmdheight=1
-- 画面最後の行をできる限り表示する
vim.opt.display = 'lastline'
vim.opt.showmode = false
vim.opt.laststatus = 2
-- not return text at line length
vim.opt.wrap = false
-- show tab, trail, eol
vim.opt.list = true
local tab_char = '▸ '
local trail_char = '▹'
vim.opt.listchars= {tab = tab_char, trail = trail_char}

-- バッファ外の~を無効
-- highlight link EndOfBuffer Ignore
vim.opt.fillchars = {
  vert = "▕", -- alternatives │
  fold = " ",
  eob = " ", -- suppress ~ at EndOfBuffer
  diff = "╱", -- alternatives = ⣿ ░ ─
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}

-- =========================
--      Status Line
-- =========================

require("statusline")

-- =========================
--       Color Scheme
-- =========================

require("colors/monokai")
