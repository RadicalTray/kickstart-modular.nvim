local CustomBuffer = require 'ui_buffer'
local M = CustomBuffer:new('[Command]', false, true)

M:set_option('buftype', 'prompt')
M:set_keymap('n', 'q', '<cmd>q<cr>', { noremap = true })
M:set_keymap('n', '<esc>', '<cmd>q<cr>', { noremap = true })

-- https://github.com/neovim/neovim/issues/14116
vim.api.nvim_buf_attach(M.bufnr, false, {
    on_lines = function(lines, bufnr)
        vim.api.nvim_set_option_value('modified', false, { buf = bufnr })
    end,
    on_changedtick = function(changedtick, bufnr)
        vim.api.nvim_set_option_value('modified', false, { buf = bufnr })
    end,
})

vim.fn.prompt_setprompt(M.bufnr, 'cmd: ')
vim.fn.prompt_setcallback(M.bufnr, function (value)
    M:close()
end)
vim.fn.prompt_setinterrupt(M.bufnr, function ()
    M:close()
end)

vim.api.nvim_create_user_command('CmdBufOpen', function()
    M:open(false, { height = 1, split = 'below' })
end, {})

return M
