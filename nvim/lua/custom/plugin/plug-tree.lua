--
-- [[  plug-tree  ]]: 侧边文件树file-manager插件(同款竞品在neovim下有neotree等，我自己这里用习惯了所以用的kyazdani42/nvim-tree.lua)
--

return {
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 40
        },
      })
    end,
    event = "VeryLazy",
  },
}
