-- Disable "format_on_save lsp_fallback" for languages that don't
-- have a well standardized coding style. You can add additional
-- languages here or re-enable it for the disabled ones.
local disable_filetypes = { c = true, cpp = true }
-- local force_filetypes = { javascript = true }

return {
  -- Autoformat
  'stevearc/conform.nvim',
  cond = false,
  event = 'BufWritePre', -- in case format on save is enabled
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format {
          async = true,
          lsp_fallback = not disable_filetypes[vim.bo.filetype],
          -- lsp_fallback = (not disable_filetypes[vim.bo.filetype]) and (force_filetypes[vim.bo.filetype] and 'always'),
          -- TODO: this ugly bruh, and also it doesn't work :D AND the problem is LSP's formatter order
        }
      end,
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      json = { 'prettierd' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      javascript = { { 'prettierd', 'prettier' } },
      javascriptreact = { { 'prettierd', 'prettier' } },
      cpp = { 'clang-format' },
      c = { 'clang-format' },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
