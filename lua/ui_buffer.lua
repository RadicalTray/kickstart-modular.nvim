local M = {
    bufnr = vim.api.nvim_create_buf(true, true)
}

function M.set_name(name)
    vim.api.nvim_buf_set_name(M.bufnr, name)
end

function M.set_keymap(mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(M.bufnr, mode, lhs, rhs, opts)
end

function M.set_lines(start, end_, strict_indexing, replacement)
    vim.api.nvim_buf_set_lines(M.bufnr, start, end_, strict_indexing, replacement)
end

function M.clear()
    M.set_lines(0, -1, true, {})
end

function M.close(force)
    if M.winnr == nil then
        return
    end
    vim.api.nvim_win_close(M.winnr, force)
    M.winnr = nil
end

function M.open(enter, config)
    config = vim.tbl_deep_extend(
        "keep",
        config,
        {
            height = 5,
            split = "below",
        }
    )
    M.winnr = vim.api.nvim_open_win(M.bufnr, enter, config)
end

return M
