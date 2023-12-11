-- Neovim 中使用以下方法设置快捷键：
-- nvim.api.nvim_set_keymap()       全局快捷键
-- nvim.api.nvim_buf_set_keymap()   Buffer 快捷

-- 样式:
-- vim.api.nvim_set_keymap("模式", "按键", "映射", "options")
-- 模式:
-- n Normal 模式
-- i Insert 模式
-- v Visual 模式
-- t Terminal 模式
-- c Command 模式
-- 按键:设置的键位
-- 映射:需要映射的键位
-- options:一般设置成{noremap = true, silent = true}，noremap表示不会递归映射

-- leader key 常用前缀，映射为空格，看到<leader>表示空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 保存本地变量
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-----------------窗口管理快捷键映射-------------------
  -- 取消 s 默认功能
  map("n", "s", "", opt)
  -- windows 分屏快捷键
  map("n", "sv", ":vsp<CR>", opt)
  map("n", "sh", ":sp<CR>", opt)
  -- 关闭当前
  map("n", "sc", "<C-w>c", opt)
  -- 关闭其他
  map("n", "so", "<C-w>o", opt)
  -- Alt + hjkl  窗口之间跳转
  map("n", "<A-h>", "<C-w>h", opt)  --左窗口
  map("n", "<A-l>", "<C-w>l", opt)  --右窗口
  map("n", "<A-k>", "<C-w>k", opt)  --上窗口
  map("n", "<A-j>", "<C-w>j", opt)  --下窗口
  -- 左右比例控制
  map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
  map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
  map("n", "s,", ":vertical resize -20<CR>", opt)--左比例
  map("n", "s.", ":vertical resize +20<CR>", opt)--右比例
  -- 上下比例控制
  map("n", "sj", ":resize +10<CR>", opt)
  map("n", "sk", ":resize -10<CR>", opt)
  map("n", "<C-Up>", ":resize -2<CR>", opt)  --上比例
  map("n", "<C-Down>", ":resize +2<CR>", opt)--下比例
  -- 等比例
  map("n", "s=", "<C-w>=", opt)

----------------------Terminal相关-----------------
  map("n", "<leader>t", ":sp | terminal<CR>", opt)--水平分屏
  map("n", "<leader>vt", ":vsp | terminal<CR>", opt)--垂直分屏
  map("t", "<Esc>", "<C-\\><C-n>", opt)
  map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)--左切换终端
  map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)--右切换终端
  map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)--上切换终端
  map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)--下切换终端

----------------------visual模式-----------------
  -- 缩进代码
  map("v", "<", "<gv", opt)
  map("v", ">", ">gv", opt)
  -- 上下移动选中文本
  map("v", "K", ":move '<-2<CR>gv-gv", opt)--上移动
  map("v", "J", ":move '>+1<CR>gv-gv", opt)--下移动

-------------------- 浏览文件--------------------
  -- 上下滚动浏览
  map("n", "<C-j>", "4j", opt)
  map("n", "<C-k>", "4k", opt)
  -- ctrl u / ctrl + d  只移动9行，默认移动半屏
  map("n", "<C-u>", "9k", opt)
  map("n", "<C-d>", "9j", opt)

--------------------插件快捷键--------------------
local pluginKeys = {}

  -- nvim-tree插件
    -- alt + m 键打开关闭tree
    map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
    -- 列表快捷键
    pluginKeys.nvimTreeList = {
      -- 打开文件或文件夹
      { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
      -- 分屏打开文件
      { key = "v", action = "vsplit" },
      { key = "h", action = "split" },
      -- 显示隐藏文件
      { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
      { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
      -- 文件操作
      { key = "<F5>", action = "refresh" },
      { key = "a", action = "create" },
      { key = "d", action = "remove" },
      { key = "r", action = "rename" },
      { key = "x", action = "cut" },
      { key = "c", action = "copy" },
      { key = "p", action = "paste" },
      { key = "s", action = "system_open" },
    }
return pluginKeys



