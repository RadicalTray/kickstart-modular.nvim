-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: For more options, you can see `:help option-list`

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
vim.opt.cmdheight = 0
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
vim.opt.scrolloff = 15

-- Disable all default neovim cursor styling (should follow terminal's cursor now)
vim.opt.guicursor = ''

vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.expandtab = true
vim.opt.showbreak = '↳'

-- User commands to quickly enable/disable autoformatting
vim.g.disable_autoformat = true
vim.api.nvim_create_user_command('AutoFormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})
vim.api.nvim_create_user_command('AutoFormatEnable', function(args)
  if args.bang then
    -- FormatEnable! will disable formatting just for this buffer
    vim.b.disable_autoformat = false
  else
    vim.g.disable_autoformat = false
  end
end, {
  desc = 'Re-enable autoformat-on-save',
  bang = true,
})

vim.filetype.add {
  extension = { rpy = 'python' },
}

-- vim: ts=2 sts=2 sw=2 et
