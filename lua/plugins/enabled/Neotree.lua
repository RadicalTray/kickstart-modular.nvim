return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window
  },
  keys = {
    { '<leader>nt', '<cmd>Neotree<CR>', desc = 'Open [N]eo[T]ree' },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- makes the 'hidden' files display differently
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false, -- only works on Windows for hidden files/directories
      },
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --              -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
      group_empty_dirs = true,
      hijack_netrw_behavior = 'disabled',
    },
    window = {
      position = 'right',
    },
  },
}
