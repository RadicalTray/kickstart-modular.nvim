local CustomBuffer = require 'ui_buffer'
local cmd_buf = CustomBuffer:new('[Command]', false, true)

cmd_buf:set_option('buftype', 'prompt')
cmd_buf:set_keymap('n', 'q', '<cmd>q<cr>', { noremap = true })
cmd_buf:set_keymap('n', '<esc>', '<cmd>q<cr>', { noremap = true })

-- https://github.com/neovim/neovim/issues/14116
vim.api.nvim_buf_attach(cmd_buf.bufnr, false, {
    on_lines = function(lines, bufnr)
        vim.api.nvim_set_option_value('modified', false, { buf = bufnr })
    end,
    on_changedtick = function(changedtick, bufnr)
        vim.api.nvim_set_option_value('modified', false, { buf = bufnr })
    end,
})

vim.fn.prompt_setprompt(cmd_buf.bufnr, 'cmd: ')
vim.fn.prompt_setcallback(cmd_buf.bufnr, function (value)
    cmd_buf:close()
end)
vim.fn.prompt_setinterrupt(cmd_buf.bufnr, function ()
    cmd_buf:close()
end)

vim.api.nvim_create_user_command('CmdBufOpen', function()
    cmd_buf:open(false, { height = 1, split = 'below' })
end, {})

return cmd_buf
