return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  enabled = true,
  event = 'InsertEnter',
  dependencies = {
    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require 'cmp'
    cmp.setup {
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert {
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),

        -- Scroll the documentation window [u]p / [d]own
        ['<C-u>'] = cmp.mapping.scroll_docs(-1),
        ['<C-d>'] = cmp.mapping.scroll_docs(1),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ['<C-y>'] = cmp.mapping.confirm { select = true },

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ['<C-Space>'] = cmp.mapping.complete {},
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
      },
    }

    vim.keymap.set({ 'n', 's', 'i' }, '<c-h>', function()
      vim.snippet.jump(-1)
    end)
    vim.keymap.set({ 'n', 's', 'i' }, '<c-l>', function()
      vim.snippet.jump(1)
    end)
  end,
}
-- vim: ts=2 sts=2 sw=2 et
