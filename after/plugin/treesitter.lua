require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or 'all' (the five listed parsers should always be installed)
  ensure_installed = {
    'c',
    'lua',
    'vim',
    'vimdoc',
    'query',
    'bash',
    'cmake',
    'css',
    'dart',
    'diff',
    'dockerfile',
    'dot',
    'git_config',
    'git_rebase',
    'gitcommit',
    'gitignore',
    'html',
    'javascript',
    'jq',
    'jsdoc',
    'json',
    'json5',
    'markdown',
    'markdown_inline',
    'python',
    'regex',
    'scss',
    'sql',
    'tsx',
    'typescript',
    'yaml',
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

-- Setting up rainbow brackets and stuff
local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
  strategy = {
    [''] = rainbow_delimiters.strategy['global'],
    vim = rainbow_delimiters.strategy['local'],
  },
  query = {
    [''] = 'rainbow-delimiters',
    lua = 'rainbow-blocks',
  },
  highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterOrange',
    'RainbowDelimiterGreen',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan',
  },
}

