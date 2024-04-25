--
-- [[  plug-cmp-window  ]]: 装饰nvim-cmp补全提示窗口的装饰美化插件
--

return {
  {
    'onsails/lspkind.nvim',
    config = function()
      require('lspkind').init({
        mode = 'symbol_text',
        preset = 'codicons',
        symbol_map = {
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰜢",
          Variable = "󰀫",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        },
      })
    end,
    event = "VeryLazy",
  }
}
