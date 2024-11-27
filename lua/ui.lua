local state = {
    last = nil,
    msg = {
        'sex',
        'drugs',
    },
}

function state.add_msg(msg)
    table.insert(state.msg, 1, msg)
end

local CustomBuffer = require 'ui_buffer'
local msg_buf = CustomBuffer:new()
local cmd_buf = CustomBuffer:new()

msg_buf:set_lines(0, -1, true, state.msg)
msg_buf:append_lines(true, { 'police' })
msg_buf:set_name('messages')
msg_buf:set_keymap('n', 'q', '<cmd>q<cr>', { noremap = true })

cmd_buf:set_name('commands')
cmd_buf:set_keymap('n', 'q', '<cmd>q<cr>', { noremap = true })
cmd_buf:set_option('buftype', 'prompt')

vim.api.nvim_create_user_command('MsgBufOpen', function()
    msg_buf:open(false, { height = 5, split = 'below' })
end, {})

vim.api.nvim_create_user_command('CmdBufOpen', function()
    cmd_buf:open(false, { height = 1, split = 'below' })
end, {})

local handlers = require 'ui_handlers'
handlers.msg_buf = msg_buf
handlers.cmd_buf = cmd_buf
handlers.state = state

-- TODO: Are ui-linegrid events needed to be handled?
-- os.execute('rm ~/.config/nvim/debug_ui_attach')
-- vim.ui_attach(
--     vim.api.nvim_create_namespace('custom_ui'),
--     { ext_messages = true }, -- implicitly activate ui-linegrid, ui-cmdline
--     function(event, ...)
--         os.execute("echo '" .. event .. "' >> ~/.config/nvim/debug_ui_attach")
--         handlers[event](...)
--     end
-- )
