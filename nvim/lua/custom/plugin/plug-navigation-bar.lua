--
-- [[  plug-navigation-bar  ]]: vscode上的文档，称呼这叫 "breadcrumb"
--

return {
  -- A navigation bar which is called "breadcrumb" in vscodium.
  {
    "SmiteshP/nvim-navic",
    config = function()
      local navic = require("nvim-navic")
      navic.setup({

      })
    end,
    event = "InsertEnter",
  },

  -- A navigation bar for supporting LS symbols.
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      --  configurations go here
    },
    config = function()
      require("barbecue").setup({
        -- [nnoremap]: Press '<leader> + b' for toggling nvim-navic.
        -- See [lua/basic/basic-keybindings-conf.lua] for details please.
      })
    end,
    event = "InsertEnter",
  }
}
