vim.cmd.hi 'clear'

vim.g.terminal_color_0  = 'NvimDarkGrey2'
vim.g.terminal_color_1  = 'NvimLightRed'
vim.g.terminal_color_2  = 'NvimLightGreen'
vim.g.terminal_color_3  = 'NvimLightYellow'
vim.g.terminal_color_4  = 'NvimLightBlue'
vim.g.terminal_color_5  = 'NvimLightMagenta'
vim.g.terminal_color_6  = 'NvimLightCyan'
vim.g.terminal_color_7  = 'NvimLightGrey2'

vim.g.terminal_color_8  = 'NvimDarkGrey3'
vim.g.terminal_color_9  = '#feadcd'
vim.g.terminal_color_10 = '#7ae7b9'
vim.g.terminal_color_11 = '#ffec9e'
vim.g.terminal_color_12 = '#5bd2f0'
vim.g.terminal_color_13 = '#ffc6ff'
vim.g.terminal_color_14 = '#9be7ff'
vim.g.terminal_color_15 = 'NvimLightGrey1'

vim.g.terminal_color_16 = 'NvimDarkGrey1'
vim.g.terminal_color_17 = 'NvimDarkRed'
vim.g.terminal_color_18 = 'NvimDarkGreen'
vim.g.terminal_color_19 = 'NvimDarkYellow'
vim.g.terminal_color_20 = 'NvimDarkBlue'
vim.g.terminal_color_21 = 'NvimDarkMagenta'
vim.g.terminal_color_22 = 'NvimDarkCyan'
vim.g.terminal_color_23 = 'NvimLightGrey3'

vim.api.nvim_set_hl(0, 'Normal', { fg = 'NvimLightGrey2', bg = 'None' })
vim.api.nvim_set_hl(0, 'Visual', { fg = 'NvimLightGrey1', bg = 'NvimDarkGrey3', ctermfg = 0, ctermbg = 15 })

vim.api.nvim_set_hl(0, 'Cursor',        { bg = 'fg', fg = 'NvimDarkGrey1' })
vim.api.nvim_set_hl(0, 'lCursor',       { bg = 'fg', fg = 'NvimDarkGrey1' })
vim.api.nvim_set_hl(0, 'CursorLine',    { bg = 'NvimDarkGrey2' })
vim.api.nvim_set_hl(0, 'CursorColumn',  { bg = 'NvimDarkGrey2' })

vim.api.nvim_set_hl(0, 'StatusLine',   { fg = 'fg', bg = 'NvimDarkGrey2', })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = 'fg', bg = 'NvimDarkGrey1', })
vim.api.nvim_set_hl(0, 'StlMode',   { fg = 'NvimLightGreen', bold = true, ctermfg = 10 })
vim.api.nvim_set_hl(0, 'StlBranch', { fg = 'NvimLightBlue', ctermfg = 12 })
vim.api.nvim_set_hl(0, 'StlReg',    { fg = 'NvimLightMagenta', bold = true, ctermfg = 13 })

vim.api.nvim_set_hl(0, 'DiffDelete', { fg = 'NvimLightGrey1', bg = 'NvimDarkRed', ctermfg = 0, ctermbg = 9 })

vim.api.nvim_set_hl(0, 'Error', { fg = 'NvimLightRed',    bold = true, ctermfg = 9 })
vim.api.nvim_set_hl(0, 'Warn',  { fg = 'NvimLightYellow', bold = true, ctermfg = 11 })
vim.api.nvim_set_hl(0, 'Todo',  { fg = 'NvimLightGreen',  bold = true, ctermfg = 10 })
vim.api.nvim_set_hl(0, 'Hack',  { fg = 'NvimLightCyan',   bold = true, ctermfg = 14 })
vim.api.nvim_set_hl(0, 'Note',  { fg = 'NvimLightBlue',   bold = true, ctermfg = 12 })
