-- unbind sleep -_-
vim.keymap.set('n', 'gs', '')

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

-- 2 choices : open or window
vim.keymap.set('n', '<leader>q', '<cmd>copen<cr>', { desc = 'Open [Q]uickfix list' })
vim.keymap.set('n', '<leader>l', '<cmd>lopen<cr>', { desc = 'Open [L]ocation list' })

-- LSP/Snippet stuff

-- unbinding whatever the fuck virtual replace is
-- because it uses gr
vim.keymap.set('n', 'gr', '')
vim.keymap.set('n', 'gR', '')

-- to make it the same with default nvim keymaps
-- putting this without lsp attach
-- should not conflict with anything unless nvim adds new default keymaps
vim.keymap.set('n', 'grd', vim.lsp.buf.definition)
vim.keymap.set('n', 'grD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'grO', vim.lsp.buf.workspace_symbol)
-- normal mode <c-h> is: move left (same as h)
vim.keymap.set({ 'n', 's', 'i' }, '<c-h>', function()
  vim.snippet.jump(-1)
end)
-- normal mode <c-l> is: nvim__redraw()
vim.keymap.set({ 'n', 's', 'i' }, '<c-l>', function()
  vim.snippet.jump(1)
end)

-- i hope i remember commenting this
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

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
