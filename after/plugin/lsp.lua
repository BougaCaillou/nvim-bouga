
require('mason').setup({
  ui = {
    border = 'rounded',
  },
})

local mason_lspconfig = require('mason-lspconfig')

-- Mason base config
mason_lspconfig.setup({
  -- Enable diagnostics
  diagnostics = {
    enable = true,
    signs = true,
    underline = true,
  },
  ensure_installed = {
    'cmake',
    'cssls',
    'docker_compose_language_service',
    'dockerls',
    'eslint',
    'html',
    'jsonls',
    'lua_ls',
    'sqlls',
    'tsserver',
    'vimls',
    'yamlls',
  },
})

-- LSP signature help
require('lsp_signature').setup({
  bind = true,
  handler_opts = {
    border = 'single',
  },
})

-- Key bindings for lsp
local lsp_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', '<leader>h', function() vim.lsp.buf.signature_help() end, opts)
end

-- Setup LSP
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  lsp_capabilities
)

-- Setup all installed servers
local get_servers = mason_lspconfig.get_installed_servers
for _, server_name in ipairs(get_servers()) do
  lspconfig[server_name].setup({
    capabilities = lsp_capabilities,
  })
end

-- Setup lua_ls
lspconfig.lua_ls.setup({
  on_attach = lsp_attach,
  capabilities = lsp_capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
})

-- Setup tsserver
lspconfig.tsserver.setup({
  on_attach = lsp_attach,
  capabilities = lsp_capabilities,
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
})

-- Autocompletion setup
local luasnip = require('luasnip')
luasnip.config.setup({})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'path'},
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip' },
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
    -- Using <C-k> to select prev item if cmp is visible, else fallback
    ['<C-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- Using <C-j> to select next item if cmp is visible, else fallback
    ['<C-j>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
})

