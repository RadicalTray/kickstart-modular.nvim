vim.cmd.hi 'clear'

vim.g.terminal_color_0  = 'NvimDarkGrey4'
vim.g.terminal_color_1  = 'NvimLightRed'
vim.g.terminal_color_2  = 'NvimLightGreen'
vim.g.terminal_color_3  = 'NvimLightYellow'
vim.g.terminal_color_4  = 'NvimLightBlue'
vim.g.terminal_color_5  = 'NvimLightMagenta'
vim.g.terminal_color_6  = 'NvimLightCyan'
vim.g.terminal_color_7  = 'NvimLightGrey2'

vim.g.terminal_color_8  = 'NvimLightGrey4'
vim.g.terminal_color_9  = '#d7005f'
vim.g.terminal_color_10 = '#00af5f'
vim.g.terminal_color_11 = '#fbb806'
vim.g.terminal_color_12 = '#0087d7'
vim.g.terminal_color_13 = '#f400a1'
vim.g.terminal_color_14 = '#00afaf'
vim.g.terminal_color_15 = 'NvimLightGrey1'

vim.g.terminal_color_16 = 'NvimDarkGrey3'
vim.g.terminal_color_17 = 'NvimDarkRed'
vim.g.terminal_color_18 = 'NvimDarkGreen'
vim.g.terminal_color_19 = 'NvimDarkYellow'
vim.g.terminal_color_20 = 'NvimDarkBlue'
vim.g.terminal_color_21 = 'NvimDarkMagenta'
vim.g.terminal_color_22 = 'NvimDarkCyan'
vim.g.terminal_color_23 = 'NvimLightGrey3'

vim.api.nvim_set_hl(0, 'Normal', { fg = 'NvimLightGrey2', bg = 'None' })

vim.api.nvim_set_hl(0, 'StlText',   { link = 'Normal' })
vim.api.nvim_set_hl(0, 'StlMode',   { fg = 'NvimLightGreen', bold = true })
vim.api.nvim_set_hl(0, 'StlBranch', { fg = 'NvimLightBlue' })
vim.api.nvim_set_hl(0, 'StlReg',    { fg = 'NvimLightMagenta', bold = true })
