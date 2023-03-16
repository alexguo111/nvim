local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit<Return>')
keymap.set('n', 'tc', ':tabclose<Return>')
keymap.set('n', 'tn', ':tabnext<Return>')
keymap.set('n', 'tp', ':tabprev<Return>')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Close window
keymap.set('', 'sq', '<C-w>q')
keymap.set('', 'sc', '<C-w>q')

-- Resize window
keymap.set('n', '<C-w><C-h>', '<C-w><')
keymap.set('n', '<C-w><C-l>', '<C-w>>')
keymap.set('n', '<C-w><C-k>', '<C-w>+')
keymap.set('n', '<C-w><C-j>', '<C-w>-')
