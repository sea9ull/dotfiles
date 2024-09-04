local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- =========================
--  IME Controll (fcitx,ibus)
-- =========================
-- Insert Modeを抜けた時は必ず日本語IMEをOFF
-- local clear_ime_cmd = 'fcitx-remote -c > /dev/null 2>&1'
-- (IMの設定でHenkanキーにIM無効を割り当てる, Ctrl+SpaceでIM有効)
local clear_ime_cmd = 'xdotool key Henkan'
augroup("VIM_IME", {clear = true})
autocmd({ "InsertLeave", "CmdwinLeave"  }, {
    pattern = { "*" },
    group = "VIM_IME",
    callback = function()
        vim.fn.system(clear_ime_cmd)
    end,
})

-- =========================
--  Binary Mode
-- =========================
-- binary-modeの設定
augroup("BinaryXXD", {clear = true})
autocmd("BufReadPre",   { pattern = "*.bin", group="BinaryXXD", command = "let &binary =1",})
autocmd("BufReadPost",  { pattern = "*", group="BinaryXXD", command = "if &binary | silent %!xxd -g 1",})
autocmd("BufReadPost",  { pattern = "*", group="BinaryXXD", command = "set ft=xxd | endif",})
autocmd("BufWritePre",  { pattern = "*", group="BinaryXXD", command = "if &binary | %!xxd -r | endif",})
autocmd("BufWritePost", { pattern = "*", group="BinaryXXD", command = "if &binary | silent %!xxd -g 1",})
autocmd("BufWritePost", { pattern = "*", group="BinaryXXD", command = "set nomod | endif",})

-- =========================
--  File Type
-- =========================
-- autocmd({"BufRead","BufNewFile"}, { pattern = "*.{md,mdwn,mkd,mkdn,mark*}", command = "set filetype=markdown", })


-- =========================
--  Syntax highlight
-- =========================
vim.opt.synmaxcol = 250
autocmd("Syntax", { pattern = "*", command = "if col('$') > 1000 | syntax off | endif", })

-- -- Remove whitespace on save
-- autocmd("BufWritePre", {
--     pattern = "*",
--     command = ":%s/\\s\\+$//e",
-- })

-- -- Don't auto commenting new lines
-- autocmd("BufEnter", {
--     pattern = "*",
--     command = "set fo-=c fo-=r fo-=o",
-- })

-- -- Restore cursor location when file is opened
-- autocmd({ "BufReadPost" }, {
--     pattern = { "*" },
--     callback = function()
--         vim.api.nvim_exec('silent! normal! g`"zv', false)
--     end,
-- })
