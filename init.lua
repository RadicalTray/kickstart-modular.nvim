local ok, env = pcall(require, 'env')
Env = ok and type(env) == 'table' and env or {}

for k, v in pairs {
  lsp = false,
  format = false,
} do
  if Env[k] == nil then
    Env[k] = v
  end
end

require 'options'
require 'keymaps'
require 'lazy-setup'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
