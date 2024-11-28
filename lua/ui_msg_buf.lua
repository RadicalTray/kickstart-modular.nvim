local CustomBuffer = require 'ui_buffer'
local M = CustomBuffer:new('[Message]', false, true)

M:set_lines(0, -1, true, { 'hi', 'hello' })
M:append_lines(true, { 'police' })
M:set_keymap('n', 'q', '<cmd>q<cr>', { noremap = true })
-- https://github.com/neovim/neovim/issues/14116
vim.api.nvim_buf_attach(M.bufnr, false, {
    on_lines = function(lines, bufnr)
        vim.api.nvim_set_option_value('modified', false, { buf = bufnr })
    end,
    on_changedtick = function(changedtick, bufnr)
        vim.api.nvim_set_option_value('modified', false, { buf = bufnr })
    end,
})

vim.api.nvim_create_user_command('MsgBufOpen', function()
    M:open(false, { height = 5, split = 'below' })
end, {})
