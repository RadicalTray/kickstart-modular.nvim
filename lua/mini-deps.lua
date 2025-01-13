local path_package = vim.fn.stdpath 'data' .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.uv.fs_stat(mini_path) then
  vim.cmd 'echo "Installing `mini.nvim`" | redraw'
  local clone_cmd = {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim',
    mini_path,
  }
  vim.system(clone_cmd):wait()
  vim.cmd 'packadd mini.nvim | helptags ALL'
  vim.cmd 'echo "Installed `mini.nvim`" | redraw'
end

require('mini.deps').setup { path = { package = path_package } }

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- treesitter
add {
  source = 'nvim-treesitter/nvim-treesitter',
  hooks = {
    post_checkout = function()
      vim.cmd ':TSUpdate'
    end,
  },
}
add { source = 'nvim-treesitter/nvim-treesitter-textobjects' }

---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    ---@diagnostic disable-next-line: unused-local
    -- disable = function(lang, bufnr)
    --   local max_filesize = 100 * 1024
    --   local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
    --   if ok and stats and stats.size > max_filesize then
    --     vim.notify 'File is too big, disabling treesitter highlighting...'
    --     return true
    --   end
    -- end,
  },
  indent = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}

add { source = 'nvim-treesitter/nvim-treesitter-context' }
require('treesitter-context').setup { enable = false }

add { source = 'folke/ts-comments.nvim' }
require('ts-comments').setup {}

add { source = 'nmac427/guess-indent.nvim' }
require('guess-indent').setup {}

require('mini.icons').setup {}
require('mini.extra').setup {}
require('mini.pick').setup {
  window = {
    prompt_cursor = '_',
  },
}
require('mini.notify').setup {
  window = {
    config = {
      border = 'none',
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
require('mini.files').setup {
  use_as_default_explorer = true,
}

local function build_blink(tbl)
  vim.notify('Building blink.cmp', vim.log.levels.INFO)
  local obj = vim.system({ 'cargo', 'build', '--release' }, { cwd = tbl.path }):wait()
  if obj.code == 0 then
    vim.notify('Building blink.cmp done', vim.log.levels.INFO)
  else
    vim.notify('Building blink.cmp failed', vim.log.levels.ERROR)
  end
end

add {
  source = 'Saghen/blink.cmp',
  hooks = {
    post_install = build_blink,
    post_checkout = build_blink,
  },
}

require('blink.cmp').setup {
  keymap = {
    ['<c-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<c-e>'] = { 'hide' },
    ['<c-y>'] = { 'select_and_accept' },
    ['<c-p>'] = { 'select_prev', 'fallback' },
    ['<c-n>'] = { 'select_next', 'fallback' },
    ['<c-u>'] = { 'scroll_documentation_up', 'fallback' },
    ['<c-d>'] = { 'scroll_documentation_down', 'fallback' },
    ['<c-l>'] = { 'snippet_forward', 'fallback' },
    ['<c-h>'] = { 'snippet_backward', 'fallback' },
  },
  fuzzy = {
    use_frecency = false,
  },
  sources = {
    default = { 'path', 'buffer' },
  },
}

if Env.lsp or Env.format then
  add { source = 'williamboman/mason.nvim' }
  require('mason').setup {}
end

if Env.lsp then
  add {
    source = 'williamboman/mason-lspconfig.nvim',
    depends = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim', --should already be setup
      'saghen/blink.cmp', -- should already be setup
      'folke/lazydev.nvim',
    },
  }

  local server_configs = {
    pylsp = {
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = { 'W391' },
              maxLineLength = 69420,
            },
          },
        },
      },
    },
  }

  ---@diagnostic disable-next-line: missing-fields
  require('mason-lspconfig').setup {
    handlers = {
      function(server_name)
        local server = server_configs[server_name] or {}
        require('lspconfig')[server_name].setup(server)
      end,
    },
  }

  ---@diagnostic disable-next-line: missing-fields
  require('lazydev').setup {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  }
end

if Env.format then
  local prettier_fmtr = function(bufnr)
    if require('conform').get_formatter_info('prettierd', bufnr).available then
      return { 'prettierd' }
    else
      return { 'prettier' }
    end
  end

  add {
    source = 'stevearc/conform.nvim',
  }

  vim.g.disable_autoformat = true
  vim.api.nvim_create_user_command('AutoFormatDisable', function(args)
    if args.bang then
      -- FormatDisable! will disable formatting just for this buffer
      vim.b.disable_autoformat = true
    else
      vim.g.disable_autoformat = true
    end
  end, {
    desc = 'Disable autoformat-on-save',
    bang = true,
  })

  vim.api.nvim_create_user_command('AutoFormatEnable', function(args)
    if args.bang then
      -- FormatEnable! will disable formatting just for this buffer
      vim.b.disable_autoformat = false
    else
      vim.g.disable_autoformat = false
    end
  end, {
    desc = 'Re-enable autoformat-on-save',
    bang = true,
  })

  require('conform').setup {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      return {
        timeout_ms = 500,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      json = prettier_fmtr,
      javascript = prettier_fmtr,
      javascriptreact = prettier_fmtr,
      cpp = { 'clang-format' },
      c = { 'clang-format' },
    },
  }

  vim.api.nvim_set_keymap('n', '<leader>f', '', {
    desc = '[F]ormat buffer',
    callback = function()
      require('conform').format {
        async = true,
      }
    end,
  })
end
