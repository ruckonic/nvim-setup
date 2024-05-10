local builtin = require('telescope.builtin')
local telescope = require('telescope')
local telscope_actions = require('telescope.actions')
local trouble = require('trouble.providers.telescope')

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-t>"] = trouble.open_with_trouble,
            },
            n = {
                ["<C-t>"] = trouble.open_with_trouble,
            }
        },
    },
});

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

