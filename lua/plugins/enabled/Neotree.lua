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
    { '<leader>nt', '<cmd>Neotree<CR>', desc = '[O]pen [F]ile [T]ree' },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- makes the 'hidden' files display differently
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false, -- only works on Windows for hidden files/directories
      },
      group_empty_dirs = true,
      hijack_netrw_behavior = 'disabled',
    },
  },
}
