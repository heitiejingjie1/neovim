local status, lualine = pcall(require, "lualine")
if not status then
  vim.notify("没有找到 lualine")
  return
end

lualine.setup({
  -- 样式
  options = {
    theme = "tokyonight",
    component_separators = { left = "|", right = "|" },
    -- https://github.com/ryanoasis/powerline-extra-symbols
  section_separators = { left = " ", right = "" },
  },
  -- 扩展
  extensions = { "nvim-tree", "toggleterm" },
  -- 用于设置不同分段，所需显示的功能模块
  sections = {
    lualine_c = {
      "filename",
      {     
        "lsp_progress",
        spinner_symbols = { " ", " ", " ", " ", " ", " " },
      },
    },

    lualine_x = {
        "filesize",
        {
        "fileformat",
        symbols = {
          unix = '', -- e712
          dos = '', -- e70f
          mac = '', -- e711
        },
        --symbols = {
          --unix = "LF",
          --dos = "CRLF",
          --mac = "CR",
        --},
      },
      "encoding",
      "filetype",
    },
  },
})
