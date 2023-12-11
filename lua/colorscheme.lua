-- 加载主题，如果不存在返回一个false值
local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- 打印消息 
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end

