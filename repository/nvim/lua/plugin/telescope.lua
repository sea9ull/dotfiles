return function()
    local conf =  {
        defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8, },
          vertical = { mirror = false, },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        -- file_sorter = require("telescope.sorters").get_fuzzy_file,
        -- file_ignore_patterns = { "node_modules" },
        -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        },
    }
    require("telescope").setup(conf)
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>s', builtin.find_files, {})
    vim.keymap.set('n', '<leader>j', builtin.current_buffer_fuzzy_find, {})
    vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
end
