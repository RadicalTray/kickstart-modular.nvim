return {
  'williamboman/mason-lspconfig.nvim',
  enabled = false,
  dependencies = {
    {
      'neovim/nvim-lspconfig',
      config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
          callback = function(event)
            local map = function(keys, func, desc)
              vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
            end

            map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
            map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
            map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
            map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
            map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            map('K', vim.lsp.buf.hover, 'Hover Documentation')
            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

            -- The following two autocommands are used to highlight references of the
            -- word under your cursor when your cursor rests there for a little while.
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.server_capabilities.documentHighlightProvider then
              vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                callback = vim.lsp.buf.document_highlight,
              })

              vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                callback = vim.lsp.buf.clear_references,
              })
            end
          end,
        })
      end,
    },
    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    local server_configs = {
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
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = server_configs[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
