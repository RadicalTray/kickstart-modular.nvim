return {
  'williamboman/mason-lspconfig.nvim',
  -- enabled = false,
  dependencies = {
    {
      'neovim/nvim-lspconfig',
      config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
          callback = function(event)
            vim.o.omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'

            local map = function(lhs, rhs, desc)
              vim.keymap.set('n', lhs, rhs, { buffer = event.buf, desc = 'LSP: ' .. desc })
            end

            -- local telescope_builtin = require 'telescope.builtin'
            -- map('gd', telescope_builtin.lsp_definitions, '[G]oto [D]efinition')
            -- map('gr', telescope_builtin.lsp_references, '[G]oto [R]eferences')
            -- map('gI', telescope_builtin.lsp_implementations, '[G]oto [I]mplementation')
            -- map('<leader>D', telescope_builtin.lsp_type_definitions, 'Type [D]efinition')
            -- map('<leader>ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
            -- map('<leader>ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
            -- map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

            local fzf = require 'fzf-lua'
            map('gd', fzf.lsp_definitions, '[G]oto [D]efinition')
            map('<leader>sr', fzf.lsp_references, '[S]earch [R]eferences')
            map('gI', fzf.lsp_implementations, '[G]oto [I]mplementation')
            map('<leader>ca', fzf.lsp_code_actions, '[C]ode [A]ction')
            map('gD', fzf.lsp_declarations, '[G]oto [D]eclaration')

            map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            map('K', vim.lsp.buf.hover, 'Hover Documentation')

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
            -- mini.completion doesn't support snippet rn
            -- completion = {
            --   callSnippet = 'Replace',
            -- },
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
    capabilities.textDocument.completion.completionItem.snippetSupport = false
    -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

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
}
