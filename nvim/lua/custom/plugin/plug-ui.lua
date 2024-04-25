--
-- [[  plug-ui  ]]: 装饰用的，提供有框框的美化窗口，而不是单纯的文本(但我个人还是在TUI mode下使用就是了-_-)
--
return {
  {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup({

      })
    end,
  }
}
