-- =========================
--    Terminal Settings
-- =========================
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local term_buf = 0
local term_win = 0
local TERMINAL_HEIGHT = 10
local SHELL="zsh"

function ToggleTerm()
    if vim.fn.win_gotoid(term_win) > 0 then
      vim.cmd.stopinsert()
      vim.cmd.hide()
    else
      vim.cmd 'botright new'
      vim.cmd ("resize " .. TERMINAL_HEIGHT)
      result, val =  pcall(function ()vim.cmd("buffer " .. term_buf) end)
      if not result then
        vim.fn.termopen(SHELL, {detach= 0})
        term_buf = vim.fn.bufnr()
      end
      vim.cmd.startinsert({ bang = true })
      term_win = vim.fn.win_getid()
    end
end
-- nondisp number

keymap("n", "<Leader>t", "", { noremap = true, callback = ToggleTerm})
keymap("t", "<Leader>t", "<C-\\><C-N>", { noremap = true, callback = ToggleTerm})
keymap("t", "<ESC>", "<C-\\><C-N>", opts)


-- =========================
--    Netrw Settings
-- =========================

vim.g.netrw_banner = 0
-- vim.g.netrw_sort_by = 'time'
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
-- vim.g.netrw_winsize = 30
vim.g.Netrw_UserMaps = { {'-', "normal! h"}, }

-- function Netrw_minus(islocal) abort
--   return "normal! h"
-- end

local expl_buf_num = 0
function ToggleVExplorer()
  if vim.fn.bufexists(expl_buf_num) ~= 0 then
    local expl_win_num = vim.fn.bufwinnr(expl_buf_num)
    if expl_win_num ~= -1 then
        local cur_win_nr = vim.fn.winnr()
        vim.cmd(expl_win_num .. 'wincmd w')
        vim.cmd 'close'
        vim.cmd(cur_win_nr .. 'wincmd w')
    end
    expl_buf_num = -1
  else
    vim.cmd [[
        1wincmd w
        Vexplore
        vertical resize 30
    ]]
    expl_buf_num = vim.fn.bufnr("%")
  end
end

keymap("n", "<Leader>f", "", {noremap = true, callback = ToggleVExplorer})
