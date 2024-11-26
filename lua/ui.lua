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
vim.api.nvim_buf_set_name(msg_buf.bufnr, "messages")
vim.api.nvim_buf_set_keymap(msg_buf.bufnr, "n", "q", "<cmd>q<cr>", { noremap = true })

vim.api.nvim_buf_set_name(cmd_buf.bufnr, "commands")
vim.api.nvim_buf_set_keymap(cmd_buf.bufnr, "n", "q", "<cmd>q<cr>", { noremap = true })

vim.api.nvim_create_user_command('MsgBufOpen', function()
    msg_buf.open(false, {})
end, {})

-- vim.ui_attach(
--     ns,
--     { ext_messages = true }, -- implicitly activate ui-linegrid, ui-cmdline
--     function(event, ...)
-- end
--     end
-- )
