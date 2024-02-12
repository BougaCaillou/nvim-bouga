
local neogit = require('neogit')

neogit.setup {
  integrations = {
    diffview = true
  }
}

vim.keymap.set('n', '<leader>gs', '<cmd>Neogit kind=split<cr><C-w>J')
