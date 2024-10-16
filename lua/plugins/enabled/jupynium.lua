return {
  "kiyoon/jupynium.nvim",
  -- enabled = false,
  ft = 'python',
  -- dependencies = {
  --   -- "rcarriga/nvim-notify", -- optional
  --   -- "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
  -- },
  build = "source ~/.Python-venv/bin/activate; pip install .",
}
