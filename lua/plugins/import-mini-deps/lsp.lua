return {
  setup = function()
    MiniDeps.add {
      source = 'neovim/nvim-lspconfig',
      depends = {
        'williamboman/mason-lspconfig.nvim',
        'williamboman/mason.nvim',
        'saghen/blink.cmp',
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

    MiniDeps.add {
      source = "folke/lazydev.nvim",
    }

---@diagnostic disable-next-line: missing-fields
    require('lazydev').setup {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    }
  end
}
