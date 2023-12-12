local packer = require('packer')

packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use('wbthomason/packer.nvim')
        -- 插件列表...
        ---------------colorscheme-------------------
        use('folke/tokyonight.nvim') --tokynight
        use('mhartington/oceanic-next') -- OceanicNext
        use({ 'ellisonleao/gruvbox.nvim', requires = { 'rktjmp/lush.nvim' } }) -- gruvbox
        use('shaunsingh/nord.nvim') -- nord
        use('ful1e5/onedark.nvim') -- onedark
        use('EdenEast/nightfox.nvim') -- nightfox

        ---------------nvim-tree:文件浏览树-------------------
        use({ 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } })

        -------------bufferline:buffer标签-------------------
        use({ 'akinsho/bufferline.nvim', tag = '*', requires = 'nvim-tree/nvim-web-devicons', 'moll/vim-bbye' })

        ------------lualine:底边显示栏----------------------
        use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
        use('arkav/lualine-lsp-progress')

        ----------- telescope:模糊搜索----------------------
        use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } })
        -- telescope 扩展
        use({ 'nvim-telescope/telescope.nvim', tag = '0.1.5', requires = { { 'nvim-lua/plenary.nvim' } } })

        ------------ banner: 自定义启动页-------------------
        use('glepnir/dashboard-nvim')
        ---project 插件
        use('ahmedkhalf/project.nvim')

        ------------ treesititer:代码高亮-------------------
        use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

        -------------LSP服务 --------------------
        use('williamboman/nvim-lsp-installer')
        -- Lspconfig\
        use('neovim/nvim-lspconfig')

        -------------自动补全-------------------
        -- 补全引擎
        use('hrsh7th/nvim-cmp')
        -- snippet 引擎
        use('hrsh7th/vim-vsnip')
        -- 补全源
        use('hrsh7th/cmp-vsnip')
        use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
        use('hrsh7th/cmp-buffer') -- { name = 'buffer' }
        use('hrsh7th/cmp-path') -- { name = 'path' }
        use('hrsh7th/cmp-cmdline') -- { name = 'cmdline' }  -- 常见编程语言代码段
        use('rafamadriz/friendly-snippets')
        -- lspkind:提示图标
        use('onsails/lspkind-nvim')
        -- indent-blanklinr:对齐线---
        use({ 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} })
        -- ispsaga
        --use "tami5/lspsaga.nvim"
        use({ 'nvimdev/lspsaga.nvim', after = 'nvim-lspconfig' })

        --------------代码格式化------------------
        use('mhartington/formatter.nvim')
        --use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })
    end,

    -- 代理站点
    config = {
        -- 并发数限制
        max_jobs = 16,
        -- 自定义源
        git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
        },
        -- 以浮动窗口打开安装列表
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
    vim.cmd,
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
