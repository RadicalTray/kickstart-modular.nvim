local state = {
    last = nil,
    msg = {
        'sex',
        'drugs',
    },
    cmd_hist = {},
}

function state.add_msg(msg)
    table.insert(state.msg, 1, msg)
end

function state.add_cmd(cmd)
    table.insert(state.cmd_hist, 1, cmd)
end

-- local msg_buf = require 'ui_msg_buf'
local cmd_buf = require 'ui_cmd_buf'

local handlers = require 'ui_handlers'
-- handlers.msg_buf = msg_buf
handlers.cmd_buf = cmd_buf
handlers.state = state

-- if true then
if false then
----
local db_hdl = assert(io.open('/home/luna/.config/nvim/debug', 'w'))
db_hdl:write()
db_hdl:close()
----
    vim.ui_attach(
        vim.api.nvim_create_namespace('custom-ui'),
        { ext_messages = true }, -- implicitly activate ui-linegrid, ui-cmdline
---@diagnostic disable-next-line: redundant-parameter
        function(event, ...)
----
local db_hdl = assert(io.open('/home/luna/.config/nvim/debug', 'a'))
db_hdl:write(vim.inspect(event, ...), '\n')
db_hdl:close()
----
            handlers[event](...)
            return true
        end
    )
end
