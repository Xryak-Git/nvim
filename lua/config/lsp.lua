require("mason").setup()
require("mason-lspconfig").setup()

local servers = { 'gopls', 'tailwindcss', 'ts_ls', 'jsonls', 'eslint', 'lua_ls', 'pyright', 'ruff' }


-- After setting up mason-lspconfig you may set up servers via lspconfig
require("mason-lspconfig").setup {
  ensure_installed = servers,
}


-- LSP Mappings + Settings -----------------------------------------------------
-- modified from: https://github.com/neovim/nvim-lspconfig#suggested-configuration
local opts = { noremap = true, silent = true }
-- Basic diagnostic mappings, these will navigate to or display diagnostics
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- -- Mappings to magical LSP functions!
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set({ 'n', 'v' }, '<leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>jr', vim.lsp.buf.references, bufopts)

  vim.keymap.set('n', '<leader>jD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>jd', vim.lsp.buf.definition, bufopts)
  if client.server_capabilities.hoverProvider then
    vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, bufopts)
  end
  vim.keymap.set('n', '<leader>ji', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-i>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>l', function()
    vim.lsp.buf.format { async = true }
  end, bufopts)
end

-- The nvim-cmp almost supports LSP's capabilitu:es so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Capabilities required for the visualstudio lsps (css, html, etc)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Activate LSPs
-- All LSPs in this list need to be manually installed via NPM/PNPM/whatevs
local util = require('lspconfig/util')

local lspconfig = require('lspconfig')
for _, lsp in pairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- Настройка maxServerMemory для TypeScript (tsserver)
  if lsp == "gopls" then
    config.cmd = { 'gopls', 'serve' }
    config.filetypes = { 'go', 'go.mod' }
    config.root_dir = util.root_pattern('go.work', 'go.mod', '.git')
    config.settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      }
    }
  end

  lspconfig[lsp].setup(config)
end
