local modes = {
  ['n'] = 'NORMAL',
  ['no'] = 'NORMAL',
  ['v'] = 'VISUAL',
  ['V'] = 'VISUAL LINE',
  [''] = 'VISUAL BLOCK',
  ['s'] = 'SELECT',
  ['S'] = 'SELECT LINE',
  [''] = 'SELECT BLOCK',
  ['i'] = 'INSERT',
  ['ic'] = 'INSERT',
  ['R'] = 'REPLACE',
  ['Rv'] = 'VISUAL REPLACE',
  ['c'] = 'COMMAND',
  ['cv'] = 'VIM EX',
  ['ce'] = 'EX',
  ['r'] = 'PROMPT',
  ['rm'] = 'MOAR',
  ['r?'] = 'CONFIRM',
  ['!'] = 'SHELL',
  ['t'] = 'TERMINAL',
}

function Get_stl_mode()
  local m = vim.api.nvim_get_mode().mode
  local fg
  if m == 'n' or m == 'no' then
    fg = 'lightgreen'
  elseif m == 'i' or m == 'ic' then
    fg = 'yellow'
  elseif m == 'v' or m == 'V' or m == '' then
    fg = 'magenta'
  elseif m == 'R' or m == 'Rv' then
    fg = 'red'
  else
    fg = 'cyan'
  end
  vim.api.nvim_set_hl(0, 'StlMode', { fg = fg, bold = true })
  return string.format('[ %s ]', modes[m] or '???'):upper()
end

return '%#StlMode#%{v:lua.Get_stl_mode()}%#Normal# %q%f %y %h%r%m%w %=%S %l:%c %p%% %L Lines '
