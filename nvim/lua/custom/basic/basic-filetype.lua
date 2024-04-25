-- 
-- [[  basic-filetype  ]]: 让nvim识别这是typst文件，而不是sql文件
--

-- tinymist or chomosuke/typst-preview.nvim
-- not to need typst-lsp for preview when using chomosuke/typst-preview.nvim.
vim.api.nvim_create_autocmd(
  {
    "BufNewFile",
    "BufRead",
  },
  {
    pattern = "*.typ",
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_option(buf, "filetype", "typst")
    end
  }
)

