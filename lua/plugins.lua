local packer = require("packer")

packer.startup({
  function(use)
  -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
  -- 插件列表...
  ---------------colorscheme-------------------
  use "folke/tokyonight.nvim"     --tokynight
  use "mhartington/oceanic-next"  -- OceanicNext
  use{ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }                        -- gruvbox
  use "shaunsingh/nord.nvim"      -- nord
  use"ful1e5/onedark.nvim"        -- onedark
  use("EdenEast/nightfox.nvim")   -- nightfox
  
  ---------------nvim-tree-------------------
  -- 需配置
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', --options
    },
  }

  -------------bufferline-------------------
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  

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
        return require("packer.util").float({ border = "single"})
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

