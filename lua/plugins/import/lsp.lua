return {
  {
    'neovim/nvim-lspconfig',
    cond = Plugin_enable_LSP,
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
        omnisharp = {
          settings = {
            FormattingOptions = {
              EnableEditorConfigSupport = true,
              OrganizeImports = true,
            },
            MsBuild = {
              LoadProjectsOnDemand = false,
            },
            RoslynExtensionsOptions = {
              EnableAnalyzersSupport = false,
              EnableImportCompletion = true,
              AnalyzeOpenDocumentsOnly = true,
            },
            Sdk = {
              IncludePrereleases = true,
            },
          },
        },
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = false

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
    cond = Plugin_enable_LSP,
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
