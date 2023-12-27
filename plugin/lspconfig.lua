-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
print("LSPCONFIG")
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>kk', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  -- add format-on-save functionality
  local result = client.supports_method("textDocument/formatting")
  if result then
    print("LSP support formatting")
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        print("Using builtin format!")
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  else
    print("Attention: LSP does not support formatting for this file type")
  end
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

--local capabilities = require('cmp_nvim_lsp').default_capabilities()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Set up lspconfig.
local lspconfig = require('lspconfig')

-- for { "c", "cpp", "objc", "objcpp", "cuda" }
--lspconfig.ccls.setup {
--  capabilities = capabilities,
--  on_attach = on_attach,
--  flags = lsp_flags,
--  init_options = {
--    compilationDatabaseDirectory = "build",
--    index = {
--      threads = 0,
--    },
--    clang = {
--      excludeArgs = { "-frounding-math" },
--    },
--  },
--}


-- { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
lspconfig.tsserver.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- for cpp
require 'lspconfig'.clangd.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}


-- for python
lspconfig.pyright.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- for ansible
require 'lspconfig'.ansiblels.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- for lua
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

--capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true

-- for css
require 'lspconfig'.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}


-- { "json", "jsonc" }
require 'lspconfig'.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}


-- for html
require 'lspconfig'.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}


-- for yaml, json, yml
-- this LSP server is installed by mason
require 'lspconfig'.spectral.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}
