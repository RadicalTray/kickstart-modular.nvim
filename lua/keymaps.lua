-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

-- 2 choices : open or window
vim.keymap.set('n', '<leader>q', '<cmd>copen<cr>', { desc = 'Open [Q]uickfix list' })
vim.keymap.set('n', '<leader>l', '<cmd>lopen<cr>', { desc = 'Open [L]ocation list' })

-- i hope i remember commenting this
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   desc = 'Highlight when yanking (copying) text',
--   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
--   callback = function()
--     vim.highlight.on_yank { higroup = 'Visual' }
--   end,
-- })

-- Make moving up/down -> move up/down to a line including wrapped text, instead of only moving up/down to a real line
-- vim.keymap.set('n', 'k', 'gk')
-- vim.keymap.set('n', 'j', 'gj')
-- vim.keymap.set('n', '<up>', 'g<up>')
-- vim.keymap.set('n', '<down>', 'g<down>')
-- vim: ts=2 sts=2 sw=2 et
