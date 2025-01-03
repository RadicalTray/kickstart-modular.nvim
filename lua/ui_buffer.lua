local CustomBuffer = {}

function CustomBuffer:new(stl, listed, scratch)
    local o = {
        bufnr = vim.api.nvim_create_buf(listed, scratch),
        stl = stl,
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function CustomBuffer:set_option(name, value)
    vim.api.nvim_set_option_value(name, value, { buf = self.bufnr })
end

function CustomBuffer:set_name(name)
    vim.api.nvim_buf_set_name(self.bufnr, name)
end

function CustomBuffer:set_keymap(mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(self.bufnr, mode, lhs, rhs, opts)
end

function CustomBuffer:set_lines(start, end_, strict_indexing, replacement)
    vim.api.nvim_buf_set_lines(self.bufnr, start, end_, strict_indexing, replacement)
end

function CustomBuffer:append_lines(strict_indexing, replacement)
    self:set_lines(-1, -1, strict_indexing, replacement)
end

function CustomBuffer:clear()
    self:set_lines(0, -1, true, {})
end

function CustomBuffer:close(force)
    if self.winnr == nil then
        return
    end

    if vim.api.nvim_win_is_valid(self.winnr) then
        vim.api.nvim_win_close(self.winnr, force)
    end
    self.winnr = nil
end

function CustomBuffer:open(enter, config)
    if self.winnr ~= nil then
        return
    end
    self.winnr = vim.api.nvim_open_win(self.bufnr, enter, config)
    self:m_onOpen()
end

function CustomBuffer:m_onOpen()
    vim.api.nvim_set_option_value('statusline', self.stl, { win = self.winnr })
    vim.api.nvim_set_option_value('number', false, { win = self.winnr })
    vim.api.nvim_set_option_value('relativenumber', false, { win = self.winnr })
end

return CustomBuffer
