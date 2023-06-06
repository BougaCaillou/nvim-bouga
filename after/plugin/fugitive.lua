
-- Open git panel
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

-- Some git commands

-- git push
vim.keymap.set('n', '<leader>gp', function() vim.cmd('Git push') end)
-- git diff as a 3 split window
vim.keymap.set('n', '<leader>gd', function() vim.cmd('Gdiffsplit!') end)
-- git write
vim.keymap.set('n', '<leader>gw', function() vim.cmd('Gwrite') end)
-- git pull
vim.keymap.set('n', '<leader>gl', function() vim.cmd('Git pull') end)
