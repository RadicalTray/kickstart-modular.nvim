return {
  -- requires fzf, ofc
  'ibhagwan/fzf-lua',
  dependencies = 'echasnovski/mini.nvim', -- for mini.icons (optional)
  -- optional external dependencies
  -- fd - better find utility
  -- rg - better grep utility
  -- bat - syntax highlighted previews when using fzf's native previewer
  -- delta - syntax highlighted git pager for git status previews
  -- nvim-dap - for Debug Adapter Protocol (DAP) support
  cmd = 'FzfLua',
  -- keys = {
  --   { '<leader>sh', '<cmd>FzfLua helptags<cr>', desc = '[S]earch [H]elp' },
  --   { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = '[S]earch [K]eymaps' },
  --   { '<leader>sb', '<cmd>FzfLua buffers<cr>', desc = '[S]earch [B]uffers' },
  --   { '<leader>sB', '<cmd>FzfLua builtin<cr>', desc = '[S]earch FzfLua [B]uiltin' },
  --   { '<leader>sg', '<cmd>FzfLua live_grep<cr>', desc = '[S]earch by [G]rep' },
  --   { '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>', desc = '[S]earch [D]iagnostics in this document' },
  --   { '<leader>sD', '<cmd>FzfLua diagnostics_workspace<cr>', desc = '[S]earch [D]iagnostics in this workspace' },
  --   { '<leader>s.', '<cmd>FzfLua resume<cr>', desc = '[S]earch resume' },
  --   { '<leader>sR', '<cmd>FzfLua registers<cr>', desc = '[S]earch [R]e[G]isters' },
  --   { '<leader>sq', '<cmd>FzfLua quickfix<cr>', desc = '[S]earch [Q]uickfix list' },
  --   { '<leader>sQ', '<cmd>FzfLua quickfix_stack<cr>', desc = '[S]earch [Q]uickfix stack' },
  --   { '<leader><leader>', '<cmd>FzfLua files<cr>', desc = '[ ] Search Files' },
  --   { '<leader>s/', '<cmd>FzfLua grep_curbuf<cr>', desc = '[S]earch in current buffer' },
  --   { '<leader>sn', string.format('<cmd>FzfLua files cwd=%s<cr>', vim.fn.stdpath 'config'), desc = '[S]earch [N]eovim files' },
  --   { '<leader>sw', '<cmd>FzfLua grep_cword<cr>', desc = '[S]earch current [W]ord' },
  --   { mode = 'v', '<leader>sv', '<cmd>FzfLua grep_visual<cr>', desc = '[S]earch [V]isual' },
  -- },
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
        },
      },
      fzf_colors = true,
      fzf_opts = { ['--cycle'] = true },
    }
  end,
}
-- vim: ts=2 sts=2 sw=2 et
