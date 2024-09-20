return {
  -- requires fzf, ofc
  'ibhagwan/fzf-lua',
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional
    -- optional external dependencies
    -- fd - better find utility
    -- rg - better grep utility
    -- bat - syntax highlighted previews when using fzf's native previewer
    -- delta - syntax highlighted git pager for git status previews
    -- nvim-dap - for Debug Adapter Protocol (DAP) support
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
    vim.keymap.set('n', '<leader>sh', fzf.helptags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', fzf.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sv', fzf.grep_visual, { desc = '[S]earch [V]isual selection' })
    vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', fzf.diagnostics_document, { desc = '[S]earch [D]iagnostics in this document' })
    vim.keymap.set('n', '<leader>sD', fzf.diagnostics_workspace, { desc = '[S]earch [D]iagnostics in this workspace' })
    vim.keymap.set('n', '<leader>s.', fzf.resume, { desc = '[S]earch resume' })
    vim.keymap.set('n', '<leader>sR', fzf.registers, { desc = '[S]earch [R]e[G]isters' })
    vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>s/', function()
      fzf.blines { previewer = false }
    end, { desc = '[S]earch in current buffer' })

    vim.keymap.set('n', '<leader>sn', function()
      fzf.files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
