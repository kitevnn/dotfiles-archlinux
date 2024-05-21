--
-- [[  Forest.lua  ]]: 一个我自己设定的lualine.nvim的主题颜色，灵感来源于everforest。
--
-- * 安装做法
--   - 将 Forest.lua 安装在 lazy.vim 的安装目录下的 lualine.nvim 里面的 theme/ 文件夹下
--
-- * 举例
--   - mv Forest.lua ~/.local/share/nvim/lazy/lualine.nvim/lua/lualine/themes/

-- This theme for my own use is inspired by everforest.
-- And thanks to the author's open source spirit.
local colors = {
  -- customized
  green    = '#60B48A',
  insert   = '#2e8b57',
  visual   = '#75D701',
  terminal = '#60B48A',
  command  = '#60B48A',

  -- everforest
  fg       = '#ffffff',
  bg0      = '#ffffff',
  bg1      = '#003f3f',
  bg3      = '#002b2b',
  aqua     = '#2e8b57',
  orange   = '#ff8036',
  purple   = '#4e4e4e',
  red      = '#e20000',
  grey1    = '#2aa198',
}

-- [NOTES]: We better set the colors which could be changed with lualine_abcxyz sometimes.
return {
  normal = {
    a = { bg = colors.green, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg1, fg = colors.visual },
    c = { bg = colors.bg1, fg = colors.fg },
    x = { bg = colors.bg1, fg = colors.fg, gui = 'bold' },
    y = { bg = colors.bg1, fg = colors.visual },
    z = { bg = colors.green, fg = colors.bg0 },
  },
  insert = {
    a = { bg = colors.insert, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg1, fg = colors.fg },
    c = { bg = colors.bg1, fg = colors.fg },
    x = { bg = colors.bg1, fg = colors.fg, gui = 'bold' },
    y = { bg = colors.bg1, fg = colors.visual },
    z = { bg = colors.green, fg = colors.bg0 },
  },
  visual = {
    a = { bg = colors.visual, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg1, fg = colors.fg },
    c = { bg = colors.bg1, fg = colors.fg },
    x = { bg = colors.bg1, fg = colors.fg, gui = 'bold' },
    y = { bg = colors.bg1, fg = colors.visual },
    z = { bg = colors.visual, fg = colors.bg0 },
  },
  replace = {
    a = { bg = colors.orange, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg1, fg = colors.fg },
    c = { bg = colors.bg1, fg = colors.fg },
    x = { bg = colors.bg1, fg = colors.fg, gui = 'bold' },
    y = { bg = colors.bg1, fg = colors.visual },
    z = { bg = colors.orange, fg = colors.fg },
  },
  command = {
    a = { bg = colors.green, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg1, fg = colors.visual },
    c = { bg = colors.bg1, fg = colors.fg },
    x = { bg = colors.bg1, fg = colors.fg, gui = 'bold' },
    y = { bg = colors.bg1, fg = colors.visual },
    z = { bg = colors.green, fg = colors.bg0 },
  },
  terminal = {
    a = { bg = colors.green, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg1, fg = colors.visual },
    c = { bg = colors.bg1, fg = colors.fg },
    x = { bg = colors.bg1, fg = colors.fg, gui = 'bold' },
    y = { bg = colors.bg1, fg = colors.visual },
    z = { bg = colors.green, fg = colors.bg0 },
  },
  inactive = {
    a = { bg = colors.bg1, fg = colors.grey1, gui = 'bold' },
    b = { bg = colors.bg1, fg = colors.grey1 },
    c = { bg = colors.bg1, fg = colors.grey1 },
    x = { bg = colors.bg1, fg = colors.grey1, gui = 'bold' },
    y = { bg = colors.bg1, fg = colors.grey1 },
    z = { bg = colors.bg1, fg = colors.grey1 },
  },
}
