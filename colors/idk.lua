local black             = '#000000'
local red               = '#d7005f'
local green             = '#00af5f'
local yellow            = '#fbb806'
local blue              = '#0087d7'
local magenta           = '#d787d7'
local cyan              = '#00afaf'
local white             = '#dadada'

local bright_black      = '#404040'
local bright_red        = '#ff005f'
local bright_green      = '#00d75f'
local bright_yellow     = '#ffee00'
local bright_blue       = '#5fafff'
local bright_magenta    = '#ff87ff'
local bright_cyan       = '#00d7d7'
local bright_white      = '#ffffff'

local cterm_black           = 0
local cterm_red             = 1
local cterm_green           = 2
local cterm_yellow          = 3
local cterm_blue            = 4
local cterm_magenta         = 5
local cterm_cyan            = 6
local cterm_white           = 7
local cterm_bright_black    = 8
local cterm_bright_red      = 9
local cterm_bright_green    = 10
local cterm_bright_yellow   = 11
local cterm_bright_blue     = 12
local cterm_bright_magenta  = 13
local cterm_bright_cyan     = 14
local cterm_bright_white    = 15

vim.g.terminal_color_0  = black
vim.g.terminal_color_1  = red
vim.g.terminal_color_2  = green
vim.g.terminal_color_3  = yellow
vim.g.terminal_color_4  = blue
vim.g.terminal_color_5  = magenta
vim.g.terminal_color_6  = cyan
vim.g.terminal_color_7  = white
vim.g.terminal_color_8  = bright_black
vim.g.terminal_color_9  = bright_red
vim.g.terminal_color_10 = bright_green
vim.g.terminal_color_11 = bright_yellow
vim.g.terminal_color_12 = bright_blue
vim.g.terminal_color_13 = bright_magenta
vim.g.terminal_color_14 = bright_cyan
vim.g.terminal_color_15 = bright_white

vim.api.nvim_set_hl(0, 'WinSeparator', { fg = bright_black, bg = 'None', ctermfg = cterm_bright_black })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = white, bg = 'None', ctermfg = cterm_white })

vim.api.nvim_set_hl(0, 'Normal',      { fg = white, ctermfg = cterm_white, bg = 'None' })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = white, ctermfg = cterm_white, bg = black,         ctermbg = cterm_black })
vim.api.nvim_set_hl(0, 'Visual',      { fg = black, ctermfg = cterm_black, bg = yellow,        ctermbg = cterm_yellow })
vim.api.nvim_set_hl(0, 'Search',      { fg = black, ctermfg = cterm_black, bg = bright_yellow, ctermbg = cterm_bright_yellow })
vim.api.nvim_set_hl(0, 'CurSearch',   { fg = black, ctermfg = cterm_black, bg = yellow,        ctermbg = cterm_yellow })

vim.api.nvim_set_hl(0, 'Pmenu',         { fg = white, ctermfg = cterm_white, bg = black, ctermbg = cterm_black })
vim.api.nvim_set_hl(0, 'PmenuExtra',    { bg = black, ctermbg = cterm_black })
vim.api.nvim_set_hl(0, 'PmenuKind',     { bg = black, ctermbg = cterm_black })
vim.api.nvim_set_hl(0, 'PmenuMatch',    { fg = red,   ctermfg = cterm_red,   bg = black,        ctermbg = cterm_black })
vim.api.nvim_set_hl(0, 'PmenuSel',      { fg = white, ctermfg = cterm_white, bg = bright_black, ctermbg = cterm_bright_black, bold = true })
vim.api.nvim_set_hl(0, 'PmenuExtraSel', { bg = bright_black, ctermbg = cterm_bright_black })
vim.api.nvim_set_hl(0, 'PmenuKindSel',  { bg = bright_black, ctermbg = cterm_bright_black })
vim.api.nvim_set_hl(0, 'PmenuMatchSel', { fg = red, ctermfg = cterm_red, bg = bright_black, ctermbg = cterm_bright_black, bold = true })

vim.api.nvim_set_hl(0, 'DiagnosticOk',    { fg = green, ctermfg = cterm_green })
vim.api.nvim_set_hl(0, 'DiagnosticHint',  { fg = blue, ctermfg = cterm_blue })
vim.api.nvim_set_hl(0, 'DiagnosticInfo',  { fg = cyan, ctermfg = cterm_cyan })
vim.api.nvim_set_hl(0, 'DiagnosticWarn',  { fg = yellow, ctermfg = cterm_yellow })
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = red, ctermfg = cterm_red })

vim.api.nvim_set_hl(0, '@variable', { fg = white, ctermfg = cterm_white })

vim.api.nvim_set_hl(0, 'Title',      { fg = white,          ctermfg = cterm_white })
vim.api.nvim_set_hl(0, 'Delimiter',  { fg = white,          ctermfg = cterm_white })
vim.api.nvim_set_hl(0, 'MatchParen', { fg = bright_magenta, ctermfg = cterm_bright_magenta })
vim.api.nvim_set_hl(0, 'Operator',   { fg = white,          ctermfg = cterm_white })
vim.api.nvim_set_hl(0, 'Special',    { fg = white,          ctermfg = cterm_white })
vim.api.nvim_set_hl(0, 'Statement',  { fg = white,          ctermfg = cterm_white })
vim.api.nvim_set_hl(0, 'Identifier', { fg = white,          ctermfg = cterm_white })
vim.api.nvim_set_hl(0, 'Constant',   { fg = white,          ctermfg = cterm_white })
vim.api.nvim_set_hl(0, 'Type',       { fg = white,          ctermfg = cterm_white })
vim.api.nvim_set_hl(0, 'Function',   { fg = white,          ctermfg = cterm_white })
vim.api.nvim_set_hl(0, 'String',     { fg = red,            ctermfg = cterm_red })
vim.api.nvim_set_hl(0, 'Comment',    { fg = bright_black,   ctermfg = cterm_bright_black })

vim.api.nvim_set_hl(0, 'DiffAdd',    { fg = black, ctermfg = cterm_black, bg = bright_green, ctermbg = cterm_bright_green })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = black, ctermfg = cterm_black, bg = bright_yellow, ctermbg = cterm_bright_yellow })
vim.api.nvim_set_hl(0, 'DiffText',   { fg = black, ctermfg = cterm_black, bg = yellow, ctermbg = cterm_yellow })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = black, ctermfg = cterm_black, bg = bright_red, ctermbg = cterm_bright_red })
vim.api.nvim_set_hl(0, 'Added',      { fg = bright_green, ctermfg = cterm_bright_green })
vim.api.nvim_set_hl(0, 'Changed',    { fg = bright_yellow, ctermfg = cterm_bright_yellow })
vim.api.nvim_set_hl(0, 'Removed',    { fg = bright_red, ctermfg = cterm_bright_red })

vim.api.nvim_set_hl(0, 'ErrorMsg',   { fg = red, ctermfg = cterm_red })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = yellow, ctermfg = cterm_yellow })

vim.api.nvim_set_hl(0, 'Todo', { fg = green, ctermfg = cterm_green })

vim.api.nvim_set_hl(0, 'FzfLuaFzfMatch', { link = 'PmenuMatch' })
