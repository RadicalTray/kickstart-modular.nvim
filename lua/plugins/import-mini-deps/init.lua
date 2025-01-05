local plugins = {
    'treesitter',
    'mini',
    'ts-comments',
    'guess-indent',
    'mason',
    'blink-cmp',
    'lsp',
    'conform',
    'arrow',
    'oil',
}

for i, plugin in ipairs(plugins) do
    local tbl = require('plugins.import-mini-deps.' .. plugin)

    vim.print(tbl)
    if tbl.info then
        MiniDeps.add(tbl.info)
    end

    if tbl.setup then
        tbl.setup()
    end
end
