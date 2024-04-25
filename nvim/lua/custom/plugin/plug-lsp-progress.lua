--
-- [[  plug-lsp-progress  ]]: 给lualine.nvim用的，目的是在LS在进行索引/构建时，能查看LS的进行到的状态
--

return {
  {
    'arkav/lualine-lsp-progress',
    event = "InsertEnter",
  }
}
