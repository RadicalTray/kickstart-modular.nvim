vim.cmd.hi 'clear'

vim.g.terminal_color_0  = 'NvimDarkGrey1'
vim.g.terminal_color_1  = 'NvimDarkRed'
vim.g.terminal_color_2  = 'NvimDarkGreen'
vim.g.terminal_color_3  = 'NvimDarkYellow'
vim.g.terminal_color_4  = 'NvimDarkBlue'
vim.g.terminal_color_5  = 'NvimDarkMagenta'
vim.g.terminal_color_6  = 'NvimDarkCyan'
vim.g.terminal_color_7  = 'NvimLightGrey1'
vim.g.terminal_color_8  = 'NvimDarkGrey2'
vim.g.terminal_color_9  = 'NvimLightRed'
vim.g.terminal_color_10 = 'NvimLightGreen'
vim.g.terminal_color_11 = 'NvimLightYellow'
vim.g.terminal_color_12 = 'NvimLightBlue'
vim.g.terminal_color_13 = 'NvimLightMagenta'
vim.g.terminal_color_14 = 'NvimLightCyan'
vim.g.terminal_color_15 = 'white'

vim.api.nvim_set_hl(0, 'Normal', { fg = 'NvimLightGrey2', bg = 'None' })

vim.api.nvim_set_hl(0, 'StlText',   { link = 'Normal' })
vim.api.nvim_set_hl(0, 'StlMode',   { fg = 'NvimLightGreen',  bold = true })
vim.api.nvim_set_hl(0, 'StlBranch', { fg = 'NvimLightBlue' })
vim.api.nvim_set_hl(0, 'StlReg',    { fg = 'NvimLightMagenta', bold = true })
