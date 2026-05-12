-- local mode_symbols = {
--   n = ' ',
--   no = ' ',
--   v = '󰋙 ',
--   V = '󰋘 ',
--   ['^V'] = '󰋙 ',
--   s = '󰜀 ',
--   S = '󰜁 ',
--   ['^S'] = '󰜀 ',
--   i = ' ',
--   ic = ' ',
--   R = '󰏃 ',
--   Rv = '󰏃 ',
--   c = 'Command',
--   cv = 'Vim Ex',
--   ce = 'Ex',
--   r = 'Prompt',
--   rm = 'More',
--   ['r?'] = 'Confirm',
--   ['!'] = '',
--   t = ' ',
-- }
local mode_colors = {
  ['n']  = 'StatuslineNormalAccent',
  ['i']  = 'StatuslineInsertAccent',
  ['ic'] = 'StatuslineInsertAccent',
  ['v']  = 'StatuslineVisualAccent',
  ['V']  = 'StatuslineVisualAccent',
  ['^V'] = 'StatuslineVisualAccent',
  ['t']  = 'StatuslineTerminalAccent',
}

local function get_mode()
  local mode = vim.api.nvim_get_mode().mode
  local color = mode_colors[mode] or 'StatuslineMiscAccent'
  -- local name = string.upper(mode_symbols[mode] or '')
  return "%#" .. color .. "#"
end

local function get_filename()
    local filename = (vim.fn.winwidth(0) >= 70) and '%f' or '%t'
    local is_readonly = vim.bo.readonly and '@' or ''
    local is_modifiable = (not vim.bo.modifiable) and '-' or (vim.bo.modified and '+' or '')
    return filename .. is_readonly .. is_modifiable
end
local ft_icons = {
    bin = ' ',
    config = ' ',
    cpp = ' ',
    csv = ' ',
    html = ' ',
    javascript = '󰌞 ',
    lua = ' ',
    php = '󰌟 ',
    python = ' ',
    rust = '󱘗 ',
    sh = ' ',
    text = ' ',
    txt = ' ',
    typescript = '󰛦 ',
    vim = ' ',
}
local function get_filetype()
  local ft = vim.o.ft
  -- return (ft and ft ~= '') and (ft_icons[ft] or ft) or ''
  return (ft and ft ~= '') and (ft_icons[ft] or ft) or ''
end
local function get_unicode()
    local enc = vim.o.fenc or vim.o.enc
    return (enc == "utf-8") and "U+%04B" or ''
end
local ff_icons = { unix = '󰌽 ', dos = ' ', mac = ' ', }
local function get_fileformat()
    local ff = vim.o.ff
    return (ff_icons[ff] or ff)
end
local function get_encoding()
  return vim.o.fenc or vim.o.enc
end

local STATUSLINE_FORMAT="%s  %%* %s%s %%<%%=%%l:%%c  %s  %s %s"
local function make_statusline()
    return string.format(STATUSLINE_FORMAT, get_mode(), get_filetype(), get_filename(), get_unicode(), get_encoding(), get_fileformat())
end

statusline = make_statusline
vim.opt.statusline = "%!v:lua.statusline()"
-- vim.opt.statusline = "%f%{&readonly==1?'@':''}%{&modifiable==0?'-':&modified==1?'+':''} %{&filetype}%<%=%l:%c  U+%04.4B %{&ff}.%{(&fenc!=''?&fenc:&enc)}"
