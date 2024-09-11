-- local modes = {
--   ['n'] = 'NORMAL',
--   ['no'] = 'O-PENDING',
--   ['nov'] = 'O-PENDING',
--   ['noV'] = 'O-PENDING',
--   ['noCTRL-V'] = 'CTRL-V',
--   ['niI'] = 'CTRL-O',
--   ['niR'] = 'CTRL-O',
--   ['niV'] = 'CTRL-O',
--   ['v'] = 'VISUAL',
--   ['V'] = 'VISUAL LINE',
--   [''] = 'VISUAL BLOCK',
--   ['s'] = 'SELECT',
--   ['S'] = 'SELECT LINE',
--   [''] = 'SELECT BLOCK',
--   ['i'] = 'INSERT',
--   ['ic'] = 'INSERT',
--   ['R'] = 'REPLACE',
--   ['Rv'] = 'VISUAL REPLACE',
--   ['c'] = 'COMMAND',
--   ['cv'] = 'VIM EX',
--   ['ce'] = 'EX',
--   ['r'] = 'PROMPT',
--   ['rm'] = 'MOAR',
--   ['r?'] = 'CONFIRM',
--   ['!'] = 'SHELL',
--   ['t'] = 'TERMINAL',
-- }

function Stl_mode()
  local m = vim.api.nvim_get_mode().mode
  local fg
  if m == 'n' or m == 'no' then
    fg = 'lightgreen'
  elseif m == 'i' or m == 'ic' then
    fg = 'lightyellow'
  elseif m == 'v' or m == 'V' or m == '' then
    fg = 'lightmagenta'
  elseif m == 'R' or m == 'Rv' then
    fg = 'lightred'
  else
    fg = 'lightcyan'
  end
  vim.api.nvim_set_hl(0, 'StlMode', { fg = fg, bold = true })
  return string.format('[%s] ', m or '???')
end

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Fetch git branch into vim.g.stl_git_branch on BufEnter',
  group = vim.api.nvim_create_augroup('custom-statusline', { clear = true }),
  callback = function()
    local result = vim.system({ 'git', 'rev-parse', '--abbrev-ref', 'HEAD' }, { cwd = vim.fn.expand '%:p:h' }):wait()
    if result.code == 0 then
      vim.g.stl_git_branch = string.gsub(result.stdout, '\n', '')
    else
      vim.g.stl_git_branch = nil
    end
  end,
})

function Stl_git_branch()
  if vim.g.stl_git_branch == nil then
    return ''
  end
  return string.format('(%s) ', vim.g.stl_git_branch)
end

function Stl_reg_recording()
  local reg = vim.fn.reg_recording()
  if reg == '' then
    return ''
  end
  return string.format('<rec "%s> ', reg)
end

vim.api.nvim_set_hl(0, 'StlText', {})
vim.api.nvim_set_hl(0, 'StlBranch', { fg = 'lightblue' })
vim.api.nvim_set_hl(0, 'StlReg', { fg = 'purple', bold = true })

-- %{} strips out leading spaces if it's in the middle (i think)
-- See https://github.com/neovim/neovim/issues/28918
return '%#StlMode#%{v:lua.Stl_mode()}%#StlBranch#%{v:lua.Stl_git_branch()}%#StlText#%<%q%f %y %h%r%m%w %=%S %#StlReg#%{v:lua.Stl_reg_recording()}%#StlText#%l:%c %-4.(%p%%%) %L Lines '
