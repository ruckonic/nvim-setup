local builtin = require('telescope.builtin')
local telescope = require('telescope')
local trouble = require('trouble.sources.telescope')

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-t>"] = trouble.open,
            },
            n = {
                ["<C-t>"] = trouble.open,
            }
        },
    },
});

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

