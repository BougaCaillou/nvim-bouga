
-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab = 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Smart indent haha
vim.opt.smartindent = true

-- No wrap pls
vim.opt.wrap = false

-- Undotree files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/vim/undodir'
vim.opt.undofile = true

-- Highlight search term
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Colors i guess
vim.opt.termguicolors = true

-- Scroll off = space always visible when scrolling
vim.opt.scrolloff = 8

-- ??
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')
vim.opt.updatetime = 50

-- Color cursor line and max length column
vim.opt.cursorline = true
vim.opt.colorcolumn = '120'

