return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.icons').setup {}

    local function fn(words)
      local tbl = {}
      for _, word in ipairs(words) do
        table.insert(tbl, string.format('%s%s%s', '%f[%w]()', word, '()%f[%W]'))
      end
      return tbl
    end

    local hipatterns = require('mini.hipatterns')
    hipatterns.setup {
      highlighters = {
        error = {
          pattern = fn { 'FIX', 'FIXME', 'BUG', },
          group = 'Error'
        },
        warn  = {
          pattern = fn { 'WARN', },
          group = 'Warn'
        },
        todo  = {
          pattern = fn { 'TODO', },
          group = 'Todo'
        },
        hack  = {
          pattern = fn { 'HACK', 'PERF', },
          group = 'Hack'
        },
        note  = {
          pattern = fn { 'NOTE', },
          group = 'Note'
        },
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    }

    require('mini.notify').setup {
      window = {
        config = {
          border = "none",
        },
        max_width_share = 0.5,
        winblend = 0,
      },
    }
    vim.notify = require('mini.notify').make_notify()

    require('mini.git').setup {}

    require('mini.diff').setup {
      view = {
        style = 'sign',
        signs = { add = '|', change = '|', delete = '_' },
      },
    }
    vim.keymap.set('n', '<leader>gh', MiniDiff.toggle_overlay, {
      desc = 'Toggle [G]it [H]unk overlay',
    })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
