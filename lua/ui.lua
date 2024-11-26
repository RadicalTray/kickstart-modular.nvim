local ns = vim.api.nvim_create_namespace('custom_messages_ui') -- is this really needed?

local state = {
    last = nil,
    texts = {
        "sex",
        "drugs",
    },
}

function state.add_msg(msg)
    table.insert(state.msg, 1, msg)
end

local msg_buf = require 'ui_buffer'
local cmd_buf = require 'ui_buffer'
local handlers = require 'ui_handlers'
handlers.msg_buf = msg_buf
handlers.cmd_buf = cmd_buf

msg_buf.set_lines(0, -1, true, state.texts)
msg_buf.set_lines(-1, -1, true, { "police" })
msg_buf.set_name("messages")
msg_buf.set_keymap("n", "q", "<cmd>q<cr>", { noremap = true })

cmd_buf.set_name("commands")
cmd_buf.set_keymap("n", "q", "<cmd>q<cr>", { noremap = true })

vim.api.nvim_create_user_command('MsgBufOpen', function()
    msg_buf.open(false, {})
end, {})

vim.api.nvim_create_user_command('CmdBufOpen', function()
    cmd_buf.open(false, {})
end, {})

-- TODO: Are ui-linegrid events mandatory?
-- vim.ui_attach(
--     ns,
--     { ext_messages = true }, -- implicitly activate ui-linegrid, ui-cmdline
--     function(event, ...)
--         handlers[event](...)
--     end
-- )
