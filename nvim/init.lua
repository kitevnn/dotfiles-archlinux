require('custom.util.util-keybindings')
require('custom.basic.basic-settings-conf')
require('custom.basic.basic-keybindings-conf')
require('custom.basic.basic-macro-conf')
require('custom.basic.basic-filetype')
require('custom.themes.theme-forest')

--
-- [[  Neovim Lazy.vim Plugin Management ⚡ ]]
--
local _M = {}
function _M.setup()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    print('installing lazy.nvim.....')
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
    print('installing lazy.nvim done.')
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup({
    ui = {
      title_pos = "right"
    },
    spec = {
      { import = "custom.plugin" },
    },
  })
end

_M.setup()


--
-- [[  Neovim Something Require  ]]
--
-- require LanguageServer: 由于我个人的配置原因，如果要引入LS配置文件，就必须要在 lazy.vim 后面(否则报错)，也就是现在的:42行处，手动配置，进行require引入。
require('custom.lsp.ls-settings')
require('custom.lsp.ls-clangd')
require('custom.lsp.ls-rustanalyzer')
require('custom.lsp.ls-gopls')
-- require('custom.lsp.ls-texlab')


-- require neovide
-- require('custom.neovide.neovide-conf')
