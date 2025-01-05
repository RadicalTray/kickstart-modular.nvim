-- Disable "format_on_save lsp_fallback" for languages that don't
-- have a well standardized coding style. You can add additional
-- languages here or re-enable it for the disabled ones.
local disable_filetypes = { c = true, cpp = true }
-- local force_filetypes = { javascript = true }

local prettier_fmtr = function(bufnr)
  if require('conform').get_formatter_info('prettierd', bufnr).available then
    return { 'prettierd' }
  else
    return { 'prettier' }
  end
end

return {
  info = {
    source = 'stevearc/conform.nvim',
  },
  setup = function()
    require('conform').setup {
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
        json = prettier_fmtr,
        javascript = prettier_fmtr,
        javascriptreact = prettier_fmtr,
        cpp = { 'clang-format' },
        c = { 'clang-format' },
      },
    }

    vim.api.nvim_set_keymap (
      'n',
      '<leader>f',
      '',
      {
        desc = '[F]ormat buffer',
        callback = function()
          require('conform').format {
            async = true,
            lsp_fallback = not disable_filetypes[vim.bo.filetype],
            -- lsp_fallback = (not disable_filetypes[vim.bo.filetype]) and (force_filetypes[vim.bo.filetype] and 'always'),
            -- TODO: this ugly bruh, and also it doesn't work :D AND the problem is LSP's formatter order
          }
        end,
      }
    )
  end
}
-- vim: ts=2 sts=2 sw=2 et
