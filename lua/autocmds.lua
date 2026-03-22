vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local ok, colorbuddy = pcall(require, "colorbuddy")
    if not ok then return end

    colorbuddy.setup()

    local Color  = require("colorbuddy.color").Color
    local colors = require("colorbuddy.color").colors
    local Group  = require("colorbuddy.group").Group
    local styles = require("colorbuddy.style").styles

    --Group.new("CursorLine", colors.none, colors.base03, styles.NONE, colors.base1)
    --Group.new("CursorLineNr", colors.yellow, colors.black, styles.NONE, colors.base1)
    Group.new("CursorLine", colors.none, colors.base02, styles.NONE, colors.base1)     -- was base03
    Group.new("CursorLineNr", colors.yellow, colors.base02, styles.NONE, colors.base1) -- matched
  end,
})
