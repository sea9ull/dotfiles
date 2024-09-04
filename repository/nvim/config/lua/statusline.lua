local STATUSLINE_FORMAT=" %s%s %%<%%=%%l:%%c  %s  %s %s"

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
  return (ft and ft ~= '') and (ft_icons[ft] or ft) or ''
end
local function get_unicode()
    return "U+%04.4B"
end
local ff_icons = {
    unix = ' ',
    dos = ' ',
    mac = ' ',
}
local function get_fileformat()
    return ff_icons[vim.o.ff] or vim.o.ff
end
local function get_encoding()
  return vim.o.fenc or vim.o.enc
end

local function set_statusline()
    vim.opt.statusline = string.format(STATUSLINE_FORMAT, get_filetype(), get_filename(), get_unicode(), get_encoding(), get_fileformat())
end
vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter', 'TabEnter' }, {
  group = vim.api.nvim_create_augroup('set_statusline', {}),
  pattern = '*',
  callback = set_statusline,
})

-- vim.opt.statusline = "%f%{&readonly==1?'@':''}%{&modifiable==0?'-':&modified==1?'+':''} %{&filetype}%<%=%l:%c  U+%04.4B %{&ff}.%{(&fenc!=''?&fenc:&enc)}"
