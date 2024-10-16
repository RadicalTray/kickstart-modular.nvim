return {
  {
    "kiyoon/jupynium.nvim",
    -- enabled = false,
    ft = 'python',
    dependencies = {
      "rcarriga/nvim-notify",
      "stevearc/dressing.nvim",
    },
    build = { "source ~/.Python-venv/bin/activate; pip install ." }
  },
}
