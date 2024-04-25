--
-- [[  plug-preview-markdown  ]]: 用 Glow (而不是浏览器) 来在终端下预览 markdown 文件(需要安装glow)
--

return {
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    event = "InsertEnter",
    opts = {
      style = "dark",
    }
  }
}
