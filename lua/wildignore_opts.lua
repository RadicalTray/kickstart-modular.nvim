-- credits to ':h netrw-gitignore', and duckduckgo ofc
--
-- why do i even put asserts in here when im the only one using this?

local function set_wildignore_from_files(files)
    assert(type(files) == 'table')
    for _, file in ipairs(files) do
        assert(type(file) == 'string')
        local ok, handle = pcall(assert, io.open(file))
        if ok then
            for line in handle:lines() do
              if line:sub(1, 1) ~= '#' then
                vim.opt.wildignore:append(line)
              end
            end
            handle:close()
        end
    end
end

local function set_wildignore_from_cmds(cmds)
    assert(type(cmds) == 'table')
    for _, cmd in ipairs(cmds) do
        assert(type(cmd) == 'table')
        local ok, global_call = pcall(vim.system, cmd)
        if ok then
            local res = global_call:wait()
            if res.code == 0 then
                for line in res.stdout:gmatch('[^\n]+') do
                    vim.opt.wildignore:append(line)
                end
            end
        end
    end
end

local function set_wildignore()
    vim.o.wildignore = ''
    local default_patterns = { '.git', '.git/' }
    for _, pattern in ipairs(default_patterns) do
        vim.opt.wildignore:append(pattern)
    end
    set_wildignore_from_files { '.gitignore', '.git/info/exclude' }
    set_wildignore_from_cmds {
        { 'git', 'config', '--global', 'core.excludesfile' },
        { 'git', 'config', '--system', 'core.excludesfile' },
    }
end

set_wildignore()

-- can also keep track of patterns from set_wildignore_from_files,
-- and remove them without having to reset it all,
-- but that might not even be better and this is not really meaningful lol
vim.api.nvim_create_autocmd('DirChanged', {
    desc = 'Set wildignore on DirChanged',
    group = vim.api.nvim_create_augroup('set-wildignore', { clear = true }),
    callback = set_wildignore
})

-- local success, lfs = pcall(require, 'lfs')
-- if success then
-- TODO: nested .gitignore
-- local function fn(path)
--   for file in lfs.dir(path) do
--     if file ~= '.' and file ~= '..' then
--       local f = path .. '/' .. file
--       if file == '.gitignore' then
--         local handle = assert(io.open(f))
--         for line in handle:lines() do
--         TODO: not accounting for relative paths in nested .gitignore
--           vim.opt.wildignore:append(line)
--         end
--       else
--         local attr = lfs.attributes(f)
--         if attr.mode == 'directory' then
--           fn(f)
--         end
--       end
--     end
--   end
-- end
-- else
--   vim.notify('go download luarocks and luafilesystem you lazy fuck', vim.log.levels.WARN)
-- end
