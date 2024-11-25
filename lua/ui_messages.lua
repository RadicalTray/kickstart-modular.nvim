-- TODO: use this instead of noice.nvim

local ns = vim.api.nvim_create_namespace('custom_messages_ui') -- is this really needed?

local last = nil
local messages = nil

vim.ui_attach(
    ns,
    { ext_messages = true },
    function(event, ...)
        if event == 'msg_show' then
            local kind, content, replace_last = ...
            for attr_id, text_chunk, hl_id in content do
            end
            if kind == "" then
            elseif kind == "confirm" then
            elseif kind == "confirm_sub" then
            elseif kind == "emsg" then
            elseif kind == "echo" then
            elseif kind == "echomsg" then
            elseif kind == "echoerr" then
            elseif kind == "list_cmd" then
            elseif kind == "lua_error" then
            elseif kind == "lua_print" then
            elseif kind == "rpc_error" then
            elseif kind == "number_prompt" then
            elseif kind == "return_prompt" then
            elseif kind == "quickfix" then
            elseif kind == "search_cmd" then
            elseif kind == "search_count" then
            elseif kind == "wildlist" then
            elseif kind == "wmsg" then
            end
        elseif event == 'msg_clear' then
        elseif event == 'msg_showmode' then
            local content = ...
        elseif event == 'msg_showcmd' then
            local content = ...
        elseif event == 'msg_ruler' then
            local content = ...
        elseif event == 'msg_history_show' then
            local entries = ...
        elseif event == 'msg_history_clear' then
        end
    end
)
