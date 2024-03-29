
-- Ultimate leader key
vim.g.mapleader = ' '

-- Ease nvim use
vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<leader>kj', ':NvimTreeOpen<CR><C-w>l:wq<CR>')
vim.keymap.set('n', '<leader>jk', ':NvimTreeOpen<CR><C-w>l:wq<CR>')
vim.keymap.set({ 'n', 'v' }, ';', ':')

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

-- Wrap codes with parentheses/brackets/braces
vim.keymap.set('v', '(', 'c(<C-r>")<Esc>vi(')
vim.keymap.set('v', '[', 'c[<C-r>"]<Esc>vi[')
vim.keymap.set('v', '{', 'c{<C-r>"}<Esc>vi{')

-- Change quotes to single/double/backquotes. Single keymap to cycle through.
vim.keymap.set('n', '<leader>q', function ()
  -- Define valid quotes
  local valid_quotes = { "'", '"', '`' }

  -- Get the current line and cursor position
  local line = vim.fn.getline('.')
  local col = vim.fn.col('.')

  -- Find the opening and closing quotes for the string
  local start_quote_index, end_quote_index, quote_char
  for i = col, 1, -1 do
    local char = line:sub(i, i)
    if vim.tbl_contains(valid_quotes, char) then
      quote_char = char
      start_quote_index = i
      break
    end
  end
  for i = col, #line do
    local char = line:sub(i, i)
    if char == quote_char then
      end_quote_index = i
      break
    end
  end

  -- If both quotes are found, cycle them
  if start_quote_index and end_quote_index then
    local current_quote_index = vim.fn.index(valid_quotes, quote_char)
    local next_quote_index = (current_quote_index + 1) % #valid_quotes + 1
    local new_quote = valid_quotes[next_quote_index]

    line = line:sub(1, start_quote_index - 1)
      .. new_quote
      .. line:sub(start_quote_index + 1, end_quote_index - 1)
      .. new_quote
      .. line:sub(end_quote_index + 1)
    vim.fn.setline('.', line)
  end
end)

-- Converts a one line javascript import to multiline
vim.keymap.set('n', '<leader>im', 'f}<Left>i,<Esc>F{ciB<CR><C-r>"<BS><CR><Esc>=<Up>:s/, /,\\r/g<CR>=iB')

-- Terminal openers
vim.keymap.set('n', '<leader>tv', ':vsplit term://zsh<CR>i')
vim.keymap.set('n', '<leader>th', ':split term://zsh<CR>i')

-- Quit terminal mode
vim.keymap.set('t', 'kj', '<C-\\><C-n>')
vim.keymap.set('t', 'jk', '<C-\\><C-n>')

-- TMUX navigation keymaps
vim.keymap.set('n', '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>')
vim.keymap.set('n', '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>')
vim.keymap.set('n', '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>')
vim.keymap.set('n', '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>')

