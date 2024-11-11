return {
  'williamboman/mason.nvim',
  cond = Plugin_enable_LSP or Plugin_enable_format,
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
    "MasonUpdate",
  },
  opts = {},
}
