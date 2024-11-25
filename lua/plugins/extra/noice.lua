-- TODO: replicate messages/split view
--  with the messages view w/o statusline if possible
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    views = {
      split = {
        win_options = {
          winhighlight = {
            Normal = "",
            FloatBorder = ""
          },
        },
      },
      cmdline = {
        win_options = {
          winhighlight = {
            Normal = "",
            IncSearch = "",
            CurSearch = "",
            Search = "",
          },
        },
      },
    },
    cmdline = {
      -- implicitly enabled by ext_messages
      view = "cmdline",
    },
    messages = {
      enabled = true,
      -- messages always move cursor to its window
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
      view_search = "virtualtext", -- holy shit this is fucking good
    },
    popupmenu = {
      enabled = false,
    },
    notify = {
      enabled = false,
    },
    lsp = {
      progress = {
        enabled = false,
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      message = {
        enabled = false,
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
