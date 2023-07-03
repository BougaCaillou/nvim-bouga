-- Tree options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 50,
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = false,
    exclude = { ".gitignore" },
  },
  git = {
    ignore = false,
  },
})
