--
-- [[  plug-ibl  ]]: neovim下最好用的 [显示缩进] 的插件
--
-- * TUI mode下，缩进线的颜色强依赖于终端colorscheme配色方案。
-- * GUI mode下，必须开启真彩色(:set termguicolors<CR>)才能设置缩进块颜色，与设置不同缩进块的颜色。
--

-- see [:h indent-blankline] for help.
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup({
        indent = {
          smart_indent_cap = true,
        },
      })
    end,
    event = "InsertEnter",
  }
}
