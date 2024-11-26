local buf = {
    bufnr = vim.api.nvim_create_buf(true, true)
}

function buf.set_lines(start, end_, strict_indexing, replacement)
    vim.api.nvim_buf_set_lines(buf.bufnr, start, end_, strict_indexing, replacement)
end

function buf.clear()
    buf.set_lines(0, -1, true, {})
end

function buf.close(force)
    if buf.winnr == nil then
        return
    end
    vim.api.nvim_win_close(buf.winnr, force)
    buf.winnr = nil
end

function buf.open(enter, config)
    config = vim.tbl_deep_extend(
        "keep",
        config,
        {
            height = 5,
            split = "below",
        }
    )
    buf.winnr = vim.api.nvim_open_win(buf.bufnr, enter, config)
end

return buf
