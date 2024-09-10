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

function Get_stl_mode()
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
  vim.api.nvim_set_hl(0, 'StlMode', { fg = fg })
  return string.format('[%s]', m or '???'):upper()
end

vim.api.nvim_set_hl(0, 'StlText', {})

return '%#StlMode#%{v:lua.Get_stl_mode()}%#StlText# %<%q%f %y %h%r%m%w %=%S %l:%c %p%% %L Lines '
