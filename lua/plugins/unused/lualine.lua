return {
  'nvim-lualine/lualine.nvim',
  enabled = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  opts = {
    options = {
      icons_enabled = false,
      component_separators = '',
      section_separators = '',
      always_divide_middle = false,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = {
        {
          'filename',
          padding = { left = 1, right = 0 },
          newfile_status = true,
          path = 1,
        },
        {
          'filetype',
          fmt = function(str)
            if str == '' then
              return str
            end
            return '[' .. str .. ']'
          end,
        },
      },
      lualine_x = { 'searchcount', {
        '%S',
        padding = {
          left = 0,
          right = 1,
        },
      } },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  },
}
