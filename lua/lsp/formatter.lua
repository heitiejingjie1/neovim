local status, formatter = pcall(require, 'formatter')
if not status then
    vim.notify('没有找到 formatter')
    return
end

local defaults = require('formatter.defaults')
local util = require('formatter.util')

formatter.setup({
    filetype = {
        lua = {
            function()
                return {
                    exe = 'stylua',
                    args = {
                        -- "--config-path "
                        --   .. os.getenv("XDG_CONFIG_HOME")
                        --   .. "/stylua/stylua.toml",
                        '-',
                    },
                    stdin = true,
                }
            end,
        },
        cpp = {
            function()
                return {
                    uncrustify = util.withl(defaults.uncrustify, 'CPP'),
                    clangformat = util.copyf(defaults.clangformat),
                    astyle = util.withl(defaults.astyle, 'c'),
                }
            end,
        },
        rust = {
            function()
                return {
                    exe = 'rustfmt',
                    args = { '--edition 2021' },
                    stdin = true,
                }
            end,
        },
    },
})

vim.api.nvim_exec(
    [[
  augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua FormatWrite
  augroup END
]],
    true
)
--
