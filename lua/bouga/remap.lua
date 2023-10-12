
-- Ultimage leader key
vim.g.mapleader = ' '

-- Ease nvim use
vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<leader>kj', ':NvimTreeOpen<CR><C-w>l:wq<CR>')
vim.keymap.set({ 'n', 'v' }, ';', ':')
vim.keymap.set('t', '<leader>kj', '<C-\\><C-n>')
vim.keymap.set('t', '<leader>jk', '<C-\\><C-n>')

-- Move line up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Append next line to current line
vim.keymap.set('n', 'J', 'mzJ`z')

-- Center page while scrolling or searching
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paster over buffer without touching vim clipboard
vim.keymap.set('x', '<leader>p', '"_dP')

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Delete buffer without touching vim clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')

-- Nope
vim.keymap.set('n', 'Q', '<nop>')

-- Exit vim
vim.keymap.set('n', '<leader>Q', ':qa<CR>')

-- Substitute current word
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Navigate between nvim windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-j>', '<C-w>j')

-- Navigate in insert mode
-- Quickfix: <C-h> was overriden by something so first, unmap it
vim.keymap.set('i', '<C-h>', '')
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-j>', '<Down>')

-- Source scurrent file
vim.keymap.set('n', '<leader><leader>', function() vim.cmd('so') end)

-- Fold code
vim.keymap.set('n', '<leader>fb', '$zf%')

-- Indent code keymaps
vim.keymap.set('n', '<S-h>', '<<')
vim.keymap.set('n', '<S-l>', '>>')
-- if in visual mode, keep selection
vim.keymap.set('v', '<S-h>', '<gv')
vim.keymap.set('v', '<S-l>', '>gv')

-- Equalize splits
vim.keymap.set('n', '<leader>=', '<C-w>=')
