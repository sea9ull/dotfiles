vim.opt.shortmess:append("c")
vim.opt.shortmess:append("I")
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = {"utf-8","cp932","iso-2022-jp","sjis","euc-jp"}
vim.opt.fileformats = {"unix","dos","mac"}
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 100
vim.opt.clipboard = "unnamedplus"
vim.opt.timeout = true
vim.opt.timeoutlen=500
vim.opt.ttimeoutlen=300
vim.opt.updatetime = 300
vim.opt.formatoptions:remove('t')
vim.opt.formatoptions:append('mM')
vim.opt.virtualedit="block"
vim.opt.whichwrap="b,s,[,],<,>"
vim.opt.backspace={"indent","eol","start"}
vim.opt.ambiwidth = "single"
vim.opt.ttyfast = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.backupskip = {"/tmp/*", "private/tmp/*"}
vim.opt.swapfile = false
vim.opt.cmdheight = 2
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.smartindent = true
vim.opt.undofile = false
vim.opt.shell = "zsh"
vim.opt.signcolumn = "no"
vim.opt.wildmenu = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.termguicolors = false
vim.opt.pumblend = 5
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.laststatus = 0
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.iskeyword="a-z,A-Z,48-57,_,.,-,>"
vim.opt.grepprg = "internal"
vim.opt.showmatch = true
vim.opt.matchtime=1
local tab_size = 4
vim.opt.expandtab = true
vim.opt.tabstop = tab_size
vim.opt.softtabstop = tab_size
vim.opt.shiftwidth = tab_size
vim.opt.shiftround = true
vim.opt.smarttab = false
vim.opt.autoindent = true
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.showtabline = 0
vim.opt.cinoptions:append(':0')
vim.opt.title = false
vim.opt.titlestring='%t'
vim.opt.showcmd = true
vim.opt.cmdheight=1
vim.opt.display = 'lastline'
vim.opt.wrap = false
vim.opt.list = true
local tab_char = '▸ '
local trail_char = '▹'
vim.opt.listchars = {tab = tab_char, trail = trail_char}
vim.opt.fillchars = { vert = "▕", fold = " ", eob = " ", diff = "╱", msgsep = "‾", foldopen = "▾", foldsep = "│", foldclose = "▸", }
vim.opt_local.autowriteall = true
vim.opt.synmaxcol = 250

-- ========================================
--   Keymaps
-- ========================================
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap('n', 'PP', '\"0p', opts)
keymap('n', 'ZZ', '<Nop>', opts)
keymap('n', 'ZQ', '<Nop>', opts)
keymap('n', '<C-Space>', '<Nop>', opts)
keymap('n', 'Q', ':help', opts)
keymap('n', '<Down>', 'gj', opts)
keymap('n', '<Up>',  'gk', opts)
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)
keymap('n', 'h', '<Left>zv', opts)
keymap('n', 'l', '<Right>zv', opts)
keymap('n', '<S-Left>' , ':5wincmd <<CR>', term_opts)
keymap('n', '<S-Right>', ':5wincmd ><CR>', term_opts)
keymap('n', '<S-Up>'   , ':5wincmd -<CR>', term_opts)
keymap('n', '<S-Down>' , ':5wincmd +<CR>', term_opts)
keymap('n', '<Leader>j', ':bnext<CR>', opts)
keymap('n', '<Leader>k', ':bprev<CR>', opts)
keymap('n', '<Leader>h', 'gT', opts)
keymap('n', '<Leader>l', 'gt', opts)
keymap('n', '<Leader>g', ':tabnew<CR>', opts)
keymap('n', '<Leader><BS>', ':q<CR>', opts)
keymap('n', '<Leader>/', ':Keybind<CR>', opts)
keymap('n', 'q', ':q<CR>', opts)

-- =========================
--  Tiny Molokai
-- =========================
vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.g.colors_name = "monokai-tiny"
local monokai = {
    Boolean         = { fg='#AE81FF',                                    },
    Character       = { fg='#E6DB74',                                    },
    Number          = { fg='#AE81FF',                                    },
    String          = { fg='#E6DB74',                                    },
    Conditional     = { fg='#F92672',               style='bold',        },
    Constant        = { fg='#AE81FF',               style='bold',        },
    Cursor          = { fg='#000000', bg='#F8F8F0',                      },
    iCursor         = { fg='#000000', bg='#F8F8F0',                      },
    Debug           = { fg='#BCA3A3',               style='bold',        },
    Define          = { fg='#66D9EF',                                    },
    Delimiter       = { fg='#8F8F8F',                                    },
    DiffAdd         = {               bg='#13354A',                      },
    DiffChange      = { fg='#89807D', bg='#4C4745',                      },
    DiffDelete      = { fg='#960050', bg='#1E0010',                      },
    DiffText        = {               bg='#4C4745', style='italic,bold', },
    Directory       = { fg='#A6E22E',               style='bold',        },
    Error           = { fg='#E6DB74', bg='#1E0010',                      },
    ErrorMsg        = { fg='#F92672', bg='#232526', style='bold',        },
    Exception       = { fg='#A6E22E',               style='bold',        },
    Float           = { fg='#AE81FF',                                    },
    FoldColumn      = { fg='#465457', bg='none',                         },
    Folded          = { fg='#465457', bg='none',                         },
    Function        = { fg='#A6E22E',                                    },
    Identifier      = { fg='#FD971F',                                    },
    Ignore          = { fg='#808080',                                    },
    IncSearch       = { fg='#C4BE89', bg='#000000',                      },
    Keyword         = { fg='#F92672',               style='bold',        },
    Label           = { fg='#E6DB74',               style='none',        },
    Macro           = { fg='#C4BE89',               style='italic',      },
    SpecialKey      = { fg='#66D9EF',               style='italic',      },
    MatchParen      = { fg='#000000', bg='none',    style='bold',        },
    ModeMsg         = { fg='#E6DB74',                                    },
    MoreMsg         = { fg='#E6DB74',                                    },
    Operator        = { fg='#F92672',                                    },
    Pmenu           = { fg='#66D9EF', bg='#000000',                      },
    PmenuSel        = {               bg='#808080',                      },
    PmenuSbar       = {               bg='#080808',                      },
    PmenuThumb      = { fg='#66D9EF',                                    },
    PreCondit       = { fg='#A6E22E',               style='bold',        },
    PreProc         = { fg='#A6E22E',                                    },
    Question        = { fg='#66D9EF',                                    },
    Repeat          = { fg='#F92672',               style='bold',        },
    Search          = { fg='#000000', bg='#FFE792',                      },
    SignColumn      = { fg='#A6E22E', bg='none',                         },
    SpecialChar     = { fg='#F92672',               style='bold',        },
    SpecialComment  = { fg='#7E8E91',               style='bold',        },
    Special         = { fg='#66D9EF',               style='italic',      },
    SpellBad        = { sp='#FF0000',               style='undercurl',   },
    SpellCap        = { sp='#7070F0',               style='undercurl',   },
    SpellLocal      = { sp='#70F0F0',               style='undercurl',   },
    SpellRare       = { sp='#FFFFFF',               style='undercurl',   },
    Statement       = { fg='#F92672',               style='bold',        },
    StatusLine      = { fg='#455354', bg='none',                         },
    StatusLineNC    = { fg='#808080', bg='none',                         },
    StorageClass    = { fg='#FD971F',               style='italic',      },
    Structure       = { fg='#66D9EF',                                    },
    Tag             = { fg='#F92672',               style='italic',      },
    Title           = { fg='#EF5939',                                    },
    Todo            = { fg='#FFFFFF',               style='bold',        },
    Typedef         = { fg='#66D9EF',                                    },
    Type            = { fg='#66D9EF',               style='none',        },
    Underlined      = { fg='#808080',               style='underline',   },
    VertSplit       = { fg='#808080', bg='none',    style='bold',        },
    VisualNOS       = {               bg='#403D3D',                      },
    Visual          = {               bg='#403D3D',                      },
    WarningMsg      = { fg='#FFFFFF', bg='#333333', style='bold',        },
    WildMenu        = { fg='#66D9EF', bg='#000000',                      },
    TabLineFill     = { fg='#1B1D1E', bg='#1B1D1E',                      },
    TabLine         = { fg='#808080', bg='#1B1D1E', style='none',        },
    Normal          = { fg='#F8F8F2', bg='none',                         },
    Comment         = { fg='#7E8E91',                                    },
    CursorLine      = {               bg='#293739',                      },
    CursorLineNr    = { fg='#FD971F',               style='none',        },
    CursorColumn    = {               bg='#293739',                      },
    ColorColumn     = {               bg='#232526',                      },
    LineNr          = { fg='#465457', bg='none',                         },
    NonText         = { fg='#465457',                                    },
    SpecialKey      = { fg='#465457',                                    },
}
local function highlight(colorscheme)
    for group, color in pairs(colorscheme) do
        local style = color.style and color.style or 'NONE'
        local fg = color.fg and color.fg or 'NONE'
        local bg = color.bg and color.bg or 'NONE'
        local sp = color.sp and 'guisp=' .. color.sp or ''
        vim.cmd(string.format('highlight %s guifg=%s guibg=%s gui=%s %s', group, fg, bg, style, sp))
    end
end
highlight(monokai)

-- =========================
--   Kitty Scrollback
-- =========================
vim.api.nvim_create_augroup("KittySBk", {})
vim.api.nvim_create_autocmd("VimEnter", { group="KittySBk", pattern = "*", command ="normal G", })
