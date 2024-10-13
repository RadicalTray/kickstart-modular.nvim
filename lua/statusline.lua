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
  local fg, ctermfg
  if m == 'n' or m == 'no' then
    fg = vim.g.terminal_color_2 or 'lightgreen'
    ctermfg = 10
  elseif m == 'i' or m == 'ic' then
    fg = vim.g.terminal_color_3 or 'lightyellow'
    ctermfg = 11
  elseif m == 'v' or m == 'V' or m == '' then
    fg = vim.g.terminal_color_5 or 'lightmagenta'
    ctermfg = 13
  elseif m == 'R' or m == 'Rv' then
    fg = vim.g.terminal_color_1 or 'lightred'
    ctermfg = 9
  else
    fg = vim.g.terminal_color_6 or 'lightcyan'
    ctermfg = 14
  end
  vim.api.nvim_set_hl(0, 'StlMode', { fg = fg, ctermfg = ctermfg, bold = true })
  return string.format('[%s] ', m or '???')
end

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Fetch git branch into vim.g.stl_git_branch on BufEnter',
  group = vim.api.nvim_create_augroup('custom-statusline', { clear = true }),
  callback = function()
    local success, call = pcall(vim.system, { 'git', 'rev-parse', '--abbrev-ref', 'HEAD' }, { cwd = vim.fn.expand '%:p:h' })
    if not success then
      return
    end

    local result = call:wait()
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

vim.g.stl_search_count = false
vim.api.nvim_create_user_command('ToggleStlSearchCount', function()
  vim.g.stl_search_count = not vim.g.stl_search_count
end, {
  desc = 'Toggle search count display on statusline',
})
-- is this expensive? -> yep i think espeically with long search
-- waiting for https://github.com/neovim/neovim/issues/18879
function Stl_search_count()
  if vim.b.stl_search_count == nil and not vim.g.stl_search_count or vim.b.stl_search_count ~= nil and not vim.b.stl_search_count then
    return ''
  end

  local result = vim.fn.searchcount { recompute = 1 }
  local searchStr = vim.fn.getreg '/'

  -- timeout
  if result.incomplete == 1 then
    return string.format('/%s [??/??] ', searchStr)

  -- max count exceeded
  elseif result.incomplete == 2 then
    if result.total > result.maxcount and result.current > result.maxcount then
      return string.format('/%s [>%d/>%d] ', searchStr, result.current, result.total)
    elseif result.total > result.maxcount then
      return string.format('/%s [%d/>%d] ', searchStr, result.current, result.total)
    end
    return string.format 'dude idk config might be wrong '
  end

  return string.format('/%s [%d/%d] ', searchStr, result.current, result.total)
end

-- %{} strips out leading spaces if it's in the middle (i think)
-- See https://github.com/neovim/neovim/issues/28918
vim.o.statusline =
  '%#StlMode#%{v:lua.Stl_mode()}%#StlBranch#%{v:lua.Stl_git_branch()}%#StatusLine#%<%q%f %y %h%r%m%w %=%S %{v:lua.Stl_search_count()}%#StlReg#%{v:lua.Stl_reg_recording()}%#StatusLine#%l:%c %-4.(%p%%%) %L Lines '
