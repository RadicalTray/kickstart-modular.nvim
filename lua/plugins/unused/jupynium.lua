return {
  "kiyoon/jupynium.nvim",
  ft = 'python',
  -- dependencies = {
  --   -- "rcarriga/nvim-notify", -- optional
  --   -- "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
  -- },
  build = "source ~/.Python-venv/bin/activate; pip install .",
}
