return {
  'williamboman/mason.nvim',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup()

    local lsp = {
      'lua-language-server',
      'omnisharp',
      'vtsls',
      'eslint-lsp',
      'css-lsp',
      'tailwindcss-language-server',
      'html-lsp',
      'jdtls',
      'bash-language-server',
      'python-lsp-server',
      'clangd',
    }

    local formatters = {
      'stylua',
      'beautysh',
      'prettierd',
      'clang-format',
    }

    require('mason-tool-installer').setup { ensure_installed = vim.list_extend(lsp, formatters) }
  end,
}
