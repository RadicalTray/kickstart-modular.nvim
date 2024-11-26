---@diagnostic disable: unused-local
local M = {
    msg_buf = nil,
    cmd_buf = nil,
}

-- Cmd
function M.cmdline_show(content, pos, firstc, prompt, indent, level)
end

function M.cmdline_pos(pos, level)
end

function M.cmdline_special_char(c, shift, level)
end

function M.cmdline_hide()
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

return M
