
-- Gruvbox setup
function ColorWithGruvbox()
  vim.o.background = 'dark'
  vim.cmd([[colorscheme gruvbox]])
end

-- Ayu setup
function ColorWithAyu()
  vim.cmd([[colorscheme ayu-mirage]])
end

-- Nightfox setup
function ColorWithNightfox()
  vim.cmd([[colorscheme dawnfox]])
end

-- Tokyonight setup
function ColorWithTokyonight()
  vim.cmd([[colorscheme tokyonight-day]])
end

-- ColorWithGruvbox()
ColorWithAyu()
-- ColorWithNightfox()
-- ColorWithTokyonight()
