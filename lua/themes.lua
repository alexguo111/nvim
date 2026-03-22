local themes = {
  "neosolarized",
  "tokyonight",
  "catppuccin",
  "kanagawa",
  "rose-pine",
  "gruvbox",
}

local theme_file = vim.fn.stdpath("config") .. "/theme.txt"

local function load_theme()
  local f = io.open(theme_file, "r")
  if f then
    local theme = f:read("*l")
    f:close()
    if theme and theme ~= "" then
      vim.cmd.colorscheme(theme)
    end
  end
end

local function switch_theme()
  vim.ui.select(themes, {
    prompt = "Select theme:",
  }, function(choice)
    if choice then
      vim.cmd.colorscheme(choice)
      local f = io.open(theme_file, "w")
      if f then
        f:write(choice)
        f:close()
      end
    end
  end)
end

load_theme()
vim.keymap.set('n', '<leader>tt', switch_theme, { desc = "Switch theme" })
