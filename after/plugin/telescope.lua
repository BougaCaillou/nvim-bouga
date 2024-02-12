
require('telescope').setup()

local builtin = require('telescope.builtin')

-- All file search
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- Project search
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Sub directories search
vim.keymap.set('n', '<leader>pd', ':GrepInDirectory<CR>', {})

-- Git file search
vim.keymap.set('n', '<C-p>', builtin.git_files, {})


