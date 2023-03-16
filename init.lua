require('base')
require('highlight')
require('maps')
require('plugins')

local has = vim.fn.has
local is_mac = has "unix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_mac then
  require('unix')
end
--if is_win then
--  require('windows')
--end
--if is_wsl then
--  require('wsl')
--end
