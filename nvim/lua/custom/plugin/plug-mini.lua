--
-- [[  plug-mini  ]]: 一套很有效的最小化插件(这里我自己安装了只安装了 [括号补全匹配])
--

return {
  -- +---------------+
  -- |               |
  -- |   mini.nvim   |
  -- |               |
  -- +---------------+
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      -- mini-pairs
      require("mini.pairs").setup({
        modes = {
          insert = true,
          normal = false,
          command = false,
          terminal = false,
        }
      })

      -- mini-clue
    end,
    event = "InsertEnter",
  },


  -- +----------------+
  -- |   sub_module   |
  -- +----------------+
  -- mini-pairs
  {
    'echasnovski/mini.pairs',
    version = '*',
    event = "InsertEnter",
  },
  -- mini-clue
}
