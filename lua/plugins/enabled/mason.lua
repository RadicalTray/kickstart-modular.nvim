return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup()

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- diagnostics = { disable = { 'missing-fields' } },
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
      vtsls = {},
      eslint = {},
      cssls = {},
      tailwindcss = {},
      html = {},
      jdtls = {},
      bashls = {},
      pylsp = {},
      clangd = {},
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
      'beautysh',
      'prettierd',
      'clang-format',
    })

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
