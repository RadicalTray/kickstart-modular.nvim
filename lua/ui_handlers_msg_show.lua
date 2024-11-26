---@diagnostic disable: unused-local
local M = {}

function M.confirm(content, replace_last)
end

function M.confirm_sub(content, replace_last)
end

function M.emsg(content, replace_last)
end

function M.echo(content, replace_last)
end

function M.echomsg(content, replace_last)
end

function M.echoerr(content, replace_last)
end

function M.list_cmd(content, replace_last)
end

function M.lua_error(content, replace_last)
end

function M.lua_print(content, replace_last)
end

function M.rpc_error(content, replace_last)
end

function M.number_prompt(content, replace_last)
end

function M.return_prompt(content, replace_last)
    vim.api.nvim_input("<cr>")
end

function M.quickfix(content, replace_last)
end

function M.search_cmd(content, replace_last)
end

function M.search_count(content, replace_last)
end

function M.wildlist(content, replace_last)
end

function M.wmsg(content, replace_last)
end

return M
