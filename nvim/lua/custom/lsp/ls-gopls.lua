--
-- [[  ls-gopls  ]]: Go 的 LanugageServer(还没有全部配置完毕，没配置完的结果是，比如inlayhints不会生效)(需要安装gopls)
--

return {
  default_config = {
    settings = {
      ['gopls'] = {
        cmd = {
          "gopls"
        },
        filetypes = {
          "go",
          "gomod",
          "gowork",
          "gotmpl",
        },
        root_dir = {
          "go.work",
          "go.mod",
          ".git",
        },
        single_file_support = true,
        -- 关于inlayhints的支持 
        -- 在 Neovim0.9+ 时，需要一个作者用爱发电编写的插件
        -- 在 Neovim0.10+ (nightly) 时，似乎是原生支持
        --  
        -- About the suport of inlayhints feature. 
        -- inlayhints feature in Neovim0.9+ (needed configure LS via looking up LS configuration.)
        -- hints = {
        --   assignVariableTypes = true,
        --   compositeLiteralFields = true,
        --   constantValues = true,
        --   functionTypeParameters = true,
        --   parameterNames = true,
        --   rangeVariableTypes = true
        -- },
      }
    }
  },
}

