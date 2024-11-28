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

local msg_buf = require 'ui_msg_buf'
local cmd_buf = require 'ui_cmd_buf'

local handlers = require 'ui_handlers'
handlers.msg_buf = msg_buf
handlers.cmd_buf = cmd_buf
handlers.state = state

-- local home = os.getenv('HOME')
-- local debug_ui = assert(io.open(home .. '/.config/nvim/debug', 'w'))
-- vim.ui_attach(
--     vim.api.nvim_create_namespace('custom_ui'),
--     { ext_messages = true }, -- implicitly activate ui-linegrid, ui-cmdline
-- ---@diagnostic disable-next-line: redundant-parameter
--     function(event, ...)
--         if debug_ui ~= nil then
--             debug_ui:write(vim.inspect({ event, ... }), '\n')
--         end
--         handlers[event](...)
--     end
-- )
