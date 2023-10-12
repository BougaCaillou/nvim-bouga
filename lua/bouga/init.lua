
require('bouga.remap')
require('bouga.set')
require('bouga.packer')

-- This is a hard fix to set expand tab because of a bug somewhere in the config
-- Expand tab would unset itself when opening a new buffer, so we set it on every buffer opening
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = "*",
  callback = function()
    vim.bo.expandtab = true
  end
})
