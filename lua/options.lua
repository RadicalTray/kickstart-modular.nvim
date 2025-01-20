-- NOTE: These should be set before lazy
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.cmd.colorscheme 'default-transparent'

vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
vim.opt.mousescroll = 'ver:1,hor:1'

-- vim.opt.laststatus = -1 -- bye :(
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.showcmd = true
vim.opt.showcmdloc = 'statusline'
vim.opt.laststatus = 2
vim.opt.cmdheight = 1
require 'statusline'
-- some hacks are needed, see https://github.com/neovim/neovim/issues/28772
-- require 'ui' -- it's a pain in the ass and unintuitive rn

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.opt.clipboard = 'unnamed'
-- vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true

vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

vim.opt.timeout = false
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
-- vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
  -- eol = '↲',
}

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Use underline style cursor
-- should be like my terminal cursor but explicitly set
-- because when guicursor is changed it doesn't change back to my terminal cursor (always to a block instead).
-- btw the size doesn't work (in Kitty at least)
-- vim.opt.guicursor = 'a:hor2,v:hor2-CursorLine'

vim.opt.guicursor = 'a:block'

vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.expandtab = true
-- vim.opt.showbreak = '↳'

-- require 'wildignore_opts'

vim.filetype.add {
  extension = { rpy = 'python' },
}

-- LSP stuff
vim.diagnostic.config { virtual_text = true }

-- vim: ts=2 sts=2 sw=2 et
