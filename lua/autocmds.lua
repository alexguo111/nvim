vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Works for ALL themes, not just neosolarized
    vim.api.nvim_set_hl(0, "CursorLine",   { bg = "#073642" })          -- base02: subtle dark highlight
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b58900", bg = "#073642" }) -- yellow nr, same bg
  end,
})
