local CustomBuffer = require 'ui_buffer'
local msg_buf = CustomBuffer:new('[Message]', false, true)
msg_buf:set_lines(0, -1, true, { 'hi', 'hello' })
msg_buf:append_lines(true, { 'police' })
msg_buf:set_keymap('n', 'q', '<cmd>q<cr>', { noremap = true })
-- https://github.com/neovim/neovim/issues/14116
vim.api.nvim_buf_attach(msg_buf.bufnr, false, {
    on_lines = function(lines, bufnr)
        vim.api.nvim_set_option_value('modified', false, { buf = bufnr })
    end,
    on_changedtick = function(changedtick, bufnr)
        vim.api.nvim_set_option_value('modified', false, { buf = bufnr })
    end,
})

vim.api.nvim_create_user_command('MsgBufOpen', function()
    msg_buf:open(false, { height = 5, split = 'below' })
end, {})
