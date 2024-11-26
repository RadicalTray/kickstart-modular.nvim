-- TODO: use this instead of noice.nvim

local ns = vim.api.nvim_create_namespace('custom_messages_ui') -- is this really needed?

local state = {
    last = nil,
    texts = {
        "sex",
        "drugs",
    },
}

function state.add(msg)
    table.insert(state.msg, 1, msg)
end

local buf = {
    bufnr = vim.api.nvim_create_buf(true, true)
}

vim.api.nvim_buf_set_name(buf.bufnr, "messages")
vim.api.nvim_buf_set_keymap(buf.bufnr, "n", "q", "<cmd>q<cr>", { noremap = true })

-- PERF: shit
function buf.set_lines(start, end_, strict_indexing, replacement)
    vim.api.nvim_buf_set_lines(buf.bufnr, start, end_, strict_indexing, replacement)
end

function buf.clear()
    buf.set_lines(0, -1, true, {})
end

function buf.open(enter, config)
    config = vim.tbl_deep_extend(
        "keep",
        config,
        {
            row = 5,
            split = "below",
        }
    )
    vim.api.nvim_open_win(buf.bufnr, enter, config)
end

buf.set_lines(0, -1, true, state.texts)
buf.set_lines(-1, -1, true, { "police" })

vim.api.nvim_create_user_command('MsgBufOpen', function()
    buf.open(false, {})
end, {})

-- vim.ui_attach(
--     ns,
--     { ext_messages = true }, -- implicitly activate ui-linegrid, ui-cmdline
--     function(event, ...)
--         if event == 'msg_show' then
--             local kind, content, replace_last = ...
--             for attr_id, text_chunk, hl_id in content do
--             end
--             if kind == "" then
--             elseif kind == "confirm" then
--             elseif kind == "confirm_sub" then
--             elseif kind == "emsg" then
--             elseif kind == "echo" then
--             elseif kind == "echomsg" then
--             elseif kind == "echoerr" then
--             elseif kind == "list_cmd" then
--             elseif kind == "lua_error" then
--             elseif kind == "lua_print" then
--             elseif kind == "rpc_error" then
--             elseif kind == "number_prompt" then
--             elseif kind == "return_prompt" then
--                 vim.api.nvim_input("<cr>")
--             elseif kind == "quickfix" then
--             elseif kind == "search_cmd" then
--             elseif kind == "search_count" then
--             elseif kind == "wildlist" then
--             elseif kind == "wmsg" then
--             end
--         elseif event == 'msg_clear' then
--         elseif event == 'msg_showmode' then
--             local content = ...
--         elseif event == 'msg_showcmd' then
--             local content = ...
--         elseif event == 'msg_ruler' then
--             local content = ...
--         elseif event == 'msg_history_show' then
--             local entries = ...
--         elseif event == 'msg_history_clear' then
--         end
--     end
-- )
