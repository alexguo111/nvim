-- null_ls in this config support python formatting, pyright does not support python formatting
-- so, I am using black to format python
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("null_ls formatting", {})
require("null-ls").setup({
  on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    print("Null_ls attached to the buffer")
    local result = client.supports_method
    if result then
      print("null_ls supports formatting")
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          print("Using null_ls for format!")
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    else
      print("NO null_ls support")
    end
  end,
  sources = {
    null_ls.builtins.formatting.black, -- formatting python
    --null_ls.builtins.formatting.prettier,
    --null_ls.builtins.formatting.clang_format,  -- format C/C++
    --null_ls.builtins.code_actions.eslint
    --    null_ls.builtins.diagnostics.eslint_d
    --null_ls.builtins.formatting.prettier.with({
    --  filetypes = { "json", "yaml", "markdown" },
    --}),
  }
})
