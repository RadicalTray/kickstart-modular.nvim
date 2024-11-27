---@diagnostic disable: unused-local, undefined-field
local M = {
    msg_buf = nil,
    cmd_buf = nil,
    state = nil,
}

-- Cmd
os.execute('rm ~/.config/nvim/debug_cmdline_show')
function M.cmdline_show(content, pos, firstc, prompt, indent, level)
    -- TODO: multiple lvl on multiple lines support? (never used it lol)
    -- TODO: apply attrs to string
    os.execute("echo '" .. vim.inspect(content) .. "' >> ~/.config/nvim/debug_cmdline_show")
    M.cmd_buf:open(true, { height = 1, split = 'bottom' })
end

function M.cmdline_pos(pos, level)
end

function M.cmdline_special_char(c, shift, level)
end

function M.cmdline_hide()
    M.cmd_buf:close()
end

function M.cmdline_block_show(lines)
end

function M.cmdline_block_append(line)
end

function M.cmdline_block_hide()
end

-- Msg
local msg_show_handlers = require 'ui_handlers_msg_show'
function M.msg_show(kind, content, replace_last)
    if kind == '' then
        return
    end
    msg_show_handlers[kind](content, replace_last)
end

function M.msg_clear()
end

function M.msg_showmode(content)
end

function M.msg_showcmd(content)
end

function M.msg_ruler(content)
end

function M.msg_history_show(entries)
end

function M.msg_history_clear()
end

-- Grid
function M.grid_resize(grid, width, height)
end

function M.default_colors_set(rgb_fg, rgb_bg, rgb_sp, cterm_fg, cterm_bg)
end

function M.hl_attr_define(id, rgb_attr, cterm_attr, info)
end

function M.hl_group_set(name, hl_id)
end

function M.grid_line(grid, row, col_start, cells, wrap)
end

function M.grid_clear(grid)
end

function M.grid_destroy(grid)
end

function M.grid_cursor_goto(grid, row, col)
end

function M.grid_scroll(grid, top, bot, left, right, rows, cols)
end

-- function Input:mount()
--   local props = self.input_props
--
--   if self._.mounted then
--     return
--   end
--
--   Input.super.mount(self)
--
--   if self._.on_change then
--     ---@deprecated
--     props.on_change = function()
--       local value_with_prompt = vim.api.nvim_buf_get_lines(self.bufnr, 0, 1, false)[1]
--       local value = string.sub(value_with_prompt, self._.prompt:length() + 1)
--       self._.on_change(value)
--     end
--
--     vim.api.nvim_buf_attach(self.bufnr, false, {
--       on_lines = props.on_change,
--     })
--   end
--
--   ---@deprecated
--   props.on_submit = function(value)
--     self._.pending_submit_value = value
--     self:unmount()
--   end
--
--   vim.fn.prompt_setcallback(self.bufnr, props.on_submit)
--
--   -- @deprecated
--   --- Use `input:unmount`
--   ---@deprecated
--   props.on_close = function()
--     self:unmount()
--   end
--
--   vim.fn.prompt_setinterrupt(self.bufnr, props.on_close)
--
--   vim.fn.prompt_setprompt(self.bufnr, self._.prompt:content())
--
--   self:on(event.InsertEnter, function()
--     if #self._.default_value then
--       vim.api.nvim_feedkeys(self._.default_value, "n", true)
--     end
--
--     if self._.prompt:length() > 0 then
--       vim.schedule(function()
--         self._.prompt:highlight(self.bufnr, self.ns_id, 1, 0)
--       end)
--     end
--   end, { once = true })
--
--   vim.api.nvim_command("startinsert!")
-- end

return M
