--
-- [[  theme-forest.lua  ]]: 一个配色方案，用的vimscript来设置的，性能也许不够用lua的nvim_set_hl()来的更快，但也足够我个人使用了(It works for me.)
--

-- vim.cmd([[colorscheme Forest]])
vim.cmd([[
  hi clear
  syntax reset
  let g:colors_name = "ForestA"
  set background=dark
  set t_Co=256

  hi Comment     ctermfg=123  ctermbg=NONE  guifg=#87ffff  guibg=NONE
  hi String      ctermfg=115  ctermbg=NONE  guifg=#87d7af  guibg=NONE
  hi Number      ctermfg=108  ctermbg=NONE  guifg=#87af87  guibg=NONE
  hi Constant    ctermfg=122  ctermbg=NONE  guifg=#87ffd7  guibg=NONE
  hi Identifier  ctermfg=224  ctermbg=NONE  guifg=#ffd7d7  guibg=NONE
  hi Conditional ctermfg=189  ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
  hi Repeat      ctermfg=189  ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
  hi Label       ctermfg=189  ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
  hi Structure   ctermfg=210  ctermbg=NONE  guifg=#ff8787  guibg=NONE
  hi SignColumn  ctermfg=122  ctermbg=NONE  guifg=#87ffd7  guibg=NONE
  hi Normal      ctermbg=NONE               guifg=NONE     guibg=NONE
  hi Visual      ctermfg=NONE ctermbg=235   guifg=NONE     guibg=#262626
  hi Title       ctermfg=115  ctermbg=NONE  guifg=#87d7af  guibg=NONE

  hi Pmenu       ctermfg=122  ctermbg=237   guifg=#87ffd7  guibg=#3a3a3a
  hi PmenuSel    ctermfg=237  ctermbg=122   guifg=#3a3a3a  guibg=#87ffd7
  hi PmenuSbar   ctermfg=237  ctermbg=122   guifg=#3a3a3a  guibg=#87ffd7
  hi PmenuThumb  ctermfg=122  ctermbg=237   guifg=#87ffd7  guibg=#3a3a3a

  hi LineNrbove  ctermfg=238  ctermbg=NONE  guifg=#444444  guibg=NONE
  hi LineNr      ctermfg=238  ctermbg=NONE  guifg=#444444  guibg=NONE
  hi LineNrBelow ctermfg=238  ctermbg=NONE  guifg=#444444  guibg=NONE
]])


-- +-------------------------------------------+
-- | To make GitSignsAdd not loaded a bg_color |
-- +-------------------------------------------+
-- We should load a nvim_configuration in a lua file instead of a vim file
-- unless we want an error which will show the error info of "ignoring ..... auto_attch ....."
vim.cmd([[
  hi GitSignsAdd ctermfg=122 ctermbg=NONE    guifg=#87ffd7  guibg=NONE
  hi GitSignsDelete ctermfg=122 ctermbg=NONE guifg=#87ffd7  guibg=NONE
  hi GitSignsChange ctermfg=122 ctermbg=NONE guifg=#87ffd7  guibg=NONE
  hi SignColumn ctermfg=122 ctermbg=NONE     guifg=#87ffd7  guibg=NONE
]])


-- +-------------------------------------------------------+
-- | To make a transparent bg_color in the floating window |
-- +-------------------------------------------------------+
vim.cmd([[
  hi NormalFloat ctermfg=122 ctermbg=NONE   guifg=#87ffd7  guibg=NONE
  hi FloatBorder ctermfg=122 ctermbg=NONE   guifg=#87ffd7  guibg=NONE
]])


-- +------------------------------------------------------------+
-- | To change the color of virtual_text which is offered by LS |
-- | - Conf: see hl-DiagnosticFloatingError for help.           |
-- +------------------------------------------------------------+
-- Diagnostic
--  hi DiagnosticError            ctermfg=123 ctermbg=238
--  hi DiagnosticInfo             ctermfg=123 ctermbg=237
--  hi DiagnosticWarn             ctermfg=123 ctermbg=237
--  hi DiagnosticHint             ctermfg=123 ctermbg=237
--  hi DiagnosticOk               ctermfg=123 ctermbg=237
--  hi DiagnosticDeprecated       ctermfg=123 ctermbg=237
vim.cmd([[
    hi DiagnosticUnnecessary      ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
    hi DiagnosticError            ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
    hi DiagnosticInfo             ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
    hi DiagnosticWarn             ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
    hi DiagnosticHint             ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
    hi DiagnosticOk               ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
    hi DiagnosticDeprecated       ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
    hi DiagnosticUnnecessary      ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
]])

-- VirtualText
--  hi DiagnosticVirtualTextError ctermfg=122 ctermbg=237
--  hi DiagnosticVirtualTextWarn  ctermfg=122 ctermbg=237
--  hi DiagnosticVirtualTextHint  ctermfg=122 ctermbg=237
--  hi DiagnosticVirtualTextOk    ctermfg=122 ctermbg=237
--  hi DiagnosticVirtualTextError ctermfg=122 ctermbg=237
vim.cmd([[
    hi DiagnosticVirtualTextError ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
    hi DiagnosticVirtualTextWarn  ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
    hi DiagnosticVirtualTextHint  ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
    hi DiagnosticVirtualTextOk    ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
    hi DiagnosticVirtualTextError ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
]])

-- Underline
vim.cmd([[
  hi DiagnosticUnderlineWarn    ctermfg=122 ctermbg=237   guifg=#87ffd7  guibg=#3a3a3a
  hi DiagnosticUnderlineInfo    ctermfg=122 ctermbg=237   guifg=#87ffd7  guibg=#3a3a3a
  hi DiagnosticUnderlineHint    ctermfg=122 ctermbg=237   guifg=#87ffd7  guibg=#3a3a3a
  hi DiagnosticUnderlineOk      ctermfg=122 ctermbg=237   guifg=#87ffd7  guibg=#3a3a3a
]])
-- FloatingWindow: control the color of info which is offered by LS.
vim.cmd([[
  hi DiagnosticFloatingError    ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
  hi DiagnosticFloatingWarn     ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
  hi DiagnosticFloatingInfo     ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
  hi DiagnosticFloatingHint     ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
  hi DiagnosticFloatingOk       ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
]])
-- Sign
vim.cmd([[
  hi DiagnosticSignError        ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
  hi DiagnosticSignWarn         ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
  hi DiagnosticSignInfo         ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
  hi DiagnosticSignHint         ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
  hi DiagnosticSignOk           ctermfg=189 ctermbg=NONE  guifg=#d7d7ff  guibg=NONE
]])

-- +-------------------------------+
-- | To change color of indentline |
-- +-------------------------------+
vim.cmd([[
  hi IndentBlanklineIndent1 ctermfg=yellow guifg=yellow
  hi IndentBlanklineIndent2 ctermfg=yellow guifg=yellow
  hi IndentBlanklineIndent3 ctermfg=yellow guifg=yellow
  hi IndentBlanklineIndent4 ctermfg=yellow guifg=yellow
  hi IndentBlanklineIndent5 ctermfg=yellow guifg=yellow
  hi IndentBlanklineIndent6 ctermfg=yellow guifg=yellow
]])

-- control the color of inlay hint in Neovim 0.10.0
vim.api.nvim_set_hl(0, "LspReferenceText", { fg = "#709080" })
vim.api.nvim_set_hl(0, "LspReferenceRead", { fg = "#709080" })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { fg = "#709080" })
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#709080" })
