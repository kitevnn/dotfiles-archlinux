--
-- [[  plug-preview-typst  ]]: 用浏览器来实时预览 typst 文件(chomosuke/typst-preview.nvim该插件作者实现了一个不依赖typst LS的预览插件，因此就算装不上typst LS照样也可以通过浏览器实时预览typst pdf)
--

return {
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '0.1.*',
    build = function()
      require 'typst-preview'.update()
    end,
    config = function()
      nnoremap('<leader>yt', '<cmd>TypstPreviewToggle<CR>')
    end,
  }
}
