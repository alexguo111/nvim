local themes = {
  "neosolarized",
  "tokyonight",
  "catppuccin",
  "kanagawa",
  "rose-pine",
  "gruvbox",
  "github_dark",
  "nordic",
  "nightfox",
  "dayfox",
  "dawnfox",
  "duskfox",
  "nordfox",
  "terafox",
  "carbonfox",
  "everforest",
  "dracula",
  "onedark",
  "material-darker",
  "material-oceanic",
  "material-palenight",
  "monokai-pro",
  "melange",
  "bamboo",
  "cyberdream",
  "oxocarbon",
}

local theme_file = vim.fn.stdpath("config") .. "/theme.txt"

local function apply_cursorline()
  vim.opt.cursorline = true
  local theme = vim.g.colors_name or ""
  if theme == "neosolarized" then
    vim.api.nvim_set_hl(0, "CursorLine",   { bg = "#073642" })          -- base02, subtle
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b58900", bg = "#073642" })
  else
    vim.api.nvim_set_hl(0, "CursorLine",   { bg = "#2a2a3d" })          -- brighter for other dark themes
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b58900", bg = "#2a2a3d" })
  end
end

local function load_theme()
  local f = io.open(theme_file, "r")
  if f then
    local theme = f:read("*l")
    f:close()
    if theme and theme ~= "" then
      vim.cmd.colorscheme(theme)
      apply_cursorline()
    end
  end
end

local function switch_theme()
  vim.ui.select(themes, {
    prompt = "Select theme:",
  }, function(choice)
    if choice then
      vim.cmd.colorscheme(choice)
      apply_cursorline()
      local f = io.open(theme_file, "w")
      if f then
        f:write(choice)
        f:close()
      end
    end
  end)
end

-- VimEnter fires after all after/plugin/ files have loaded, so cursorline wins
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    load_theme()
    apply_cursorline()
  end,
})

vim.keymap.set('n', '<leader>tt', switch_theme, { desc = "Switch theme" })
