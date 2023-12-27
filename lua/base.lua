vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
-- show line number
vim.wo.number = true

vim.opt.title = true
vim.opt.hlsearch = true
-- show the cmd at the bottom right
vim.opt.showcmd = true
vim.opt.backup = false
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
-- display lines at least 10 above or 10 below the cursor
vim.opt.scrolloff = 10
--vim.opt.shell = 'fish'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'

-- tab configuration
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2


-- display command like %s dynamically
vim.opt.inccommand = 'split'
-- ingnore case of the search keyword
vim.opt.ignorecase = true
-- indent from the breakpoint of the line if line exceeds to width of the screen
vim.opt.breakindent = true
-- autoindent
vim.opt.ai = true
-- smart indentation(e.g. function braces)
vim.opt.si = true
-- even if the line is too long, we will not wrap it
vim.opt.wrap = false
vim.opt.backspace = 'start,eol,indent'
-- e.g. if using find command, it will search the current path and its subdirectories
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})
-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
