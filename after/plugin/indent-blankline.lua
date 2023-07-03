vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "tab:▸▸"

-- Fixing those groups that were blue by default
vim.cmd [[highlight IndentBlanklineChar guifg=#7c6f64 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#7c6f64 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineSpaceCharBlankline guifg=#7c6f64 gui=nocombine]]

require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
}
