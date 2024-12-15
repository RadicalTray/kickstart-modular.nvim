return {
  {
    'neovim/nvim-lspconfig',
    cond = Env.lsp,
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
      'echasnovski/mini.nvim', -- for notify
    },
    config = function()
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

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

---@diagnostic disable-next-line: missing-fields
      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = server_configs[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('keep', server.capabilities or {}, capabilities)
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
  {
    "folke/lazydev.nvim",
    cond = Env.lsp,
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
