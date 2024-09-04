vim.cmd("autocmd!")
vim.scriptencoding = "utf-8"
vim.wo.number = true

vim.api.nvim_create_user_command("Cf", function(opts)
    vim.cmd("e " .. "~/dev/file.md")
end, {})
