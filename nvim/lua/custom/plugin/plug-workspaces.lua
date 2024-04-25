--
-- [[  plug-workspaces  ]]: 提供一个像vscode的 [open workfolder打开工作区] 与 [close workfolder关闭工作区] 的关于 [项目管理] 的插件。
--

-- See [:h workspaces-usage] for help.
return {
  {
    'natecraddock/workspaces.nvim',
    config = function()
      require("workspaces").setup({

      })
    end,
    event = "InsertEnter",
  }
}
