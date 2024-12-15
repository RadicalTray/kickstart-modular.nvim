return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      highlight = {
        enable = true,
---@diagnostic disable-next-line: unused-local
        disable = function(lang, bufnr)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
          if ok and stats and stats.size > max_filesize then
            vim.notify('File is too big, disabling treesitter highlighting...')
            return true
          end
        end,
      },
      indent = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = true },
    }
    require('treesitter-context').setup {
      enable = false,
    }
  end,
}
-- vim: ts=2 sts=2 sw=2 et
