return {
  'williamboman/mason.nvim',
  cond = Env.lsp or Env.format,
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
