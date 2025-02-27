return {
  'OXY2DEV/markview.nvim',
  enabled = false,
  -- lazy = false, -- Recommended
  ft = 'markdown', -- If you decide to lazy-load anyway
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons', -- optional
  },
  opts = {
    modes = { 'n', 'no', 'c' },
    hybrid_modes = { 'n' },
    callbacks = {
      on_enable = function(_, win)
        vim.wo[win].conceallevel = 2
        vim.wo[win].concealcursor = 'c'
      end,
    },
  },
}
