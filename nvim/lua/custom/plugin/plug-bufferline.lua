--
-- [[  plug-bufferline  ]]: 上面的Tab标签页
--

-- see :h bufferline-configuration for help.
return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          max_name_length = 40,
          tab_size = 40,
          indicator = {
            icon = '  →',
          },
        },
      })
    end,
    event = "VimEnter",
  }
}
