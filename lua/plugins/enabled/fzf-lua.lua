return {
  -- requires fzf, ofc
  'ibhagwan/fzf-lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional
    -- optional external dependencies
    -- fd - better find utility
    -- rg - better grep utility
    -- bat - syntax highlighted previews when using fzf's native previewer
    -- delta - syntax highlighted git pager for git status previews
    -- nvim-dap - for Debug Adapter Protocol (DAP) support
  },
  cmd = 'FzfLua',
  keys = {
    { '<leader>sh', '<cmd>FzfLua helptags<cr>', desc = '[S]earch [H]elp' },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = '[S]earch [K]eymaps' },
    { '<leader>sf', '<cmd>FzfLua files<cr>', desc = '[S]earch [F]iles' },
    { '<leader>ss', '<cmd>FzfLua builtin<cr>', desc = '[S]earch [S]elect Telescope' },
    { '<leader>sv', '<cmd>FzfLua grep_visual<cr>', desc = '[S]earch [V]isual selection' },
    { '<leader>sg', '<cmd>FzfLua live_grep<cr>', desc = '[S]earch by [G]rep' },
    { '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>', desc = '[S]earch [D]iagnostics in this document' },
    { '<leader>sD', '<cmd>FzfLua diagnostics_workspace<cr>', desc = '[S]earch [D]iagnostics in this workspace' },
    { '<leader>s.', '<cmd>FzfLua resume<cr>', desc = '[S]earch resume' },
    { '<leader>sR', '<cmd>FzfLua registers<cr>', desc = '[S]earch [R]e[G]isters' },
    { '<leader><leader>', '<cmd>FzfLua buffers<cr>', desc = '[ ] Find existing buffers' },
    { '<leader>s/', '<cmd>FzfLua blines previewer=false<cr>', desc = '[S]earch in current buffer' },
    { '<leader>sn', string.format('<cmd>FzfLua files cwd=%s<cr>', vim.fn.stdpath 'config'), desc = '[S]earch [N]eovim files' },
  },
  config = function()
    local fzf = require 'fzf-lua'
    local actions = require 'fzf-lua.actions'
    fzf.setup {
      winopts = {
        border = 'none',
        fullscreen = true,
      },
      actions = {
        files = {
          false,
          ['enter'] = actions.file_edit_or_qf,
          ['ctrl-s'] = actions.file_split,
          ['ctrl-v'] = actions.file_vsplit,
          ['ctrl-t'] = actions.file_tabedit,
          ['ctrl-q'] = { fn = actions.file_sel_to_qf, prefix = 'select-all' },
          -- ['ctrl-l'] = actions.file_sel_to_ll, -- what is this?
        },
      },
      fzf_colors = true,
      fzf_opts = { ['--cycle'] = true },
    }
  end,
}
-- vim: ts=2 sts=2 sw=2 et
