--
-- [[  plug-nvim-lspconfig  ]]: LSP Client(LSP客户端)
--

-- see [:h lspconfig-all] 或 [nvim-lspconfig在github的仓库源代码] for help
return {
  {
    'neovim/nvim-lspconfig',
    config = function()
    end,
    -- InsertEnter to VimEnter
    event = "VimEnter",
  }
}
