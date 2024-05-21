--
-- [[  basic-settings-conf  ]]: neovim的基本设置
--

local options = vim.o
options.tabstop = 2
options.softtabstop = 2
options.shiftwidth = 2
options.expandtab = true
options.hlsearch = true
options.incsearch = true
options.smartcase = true
options.tw = 0
options.cursorline = true
options.cursorlineopt = "number"
options.number = true
-- options.t_Co = 256
-- options.endcoding = "utf-8"

-- autocmd设置
vim.cmd([[au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown nofoldenable]])
vim.cmd([[autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold]])
vim.cmd([[highlight LineNr ctermfg=238 guifg=#444444]])
vim.cmd([[
    augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
        autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    augroup END
]])

-- Use showtabline in gui vim
-- store tabpages and globals in session
vim.cmd([[
    set guioptions-=e " Use showtabline in gui vim
    set sessionoptions+=tabpages,globals " store tabpages and globals in session
]])

-- 建议使用 folke/noice.nvim 来代替 options.cmdheight=0 来让底下的bar不要那么抬得那么高
options.cmdheight = 0

-- for neovide.
-- options.guifont = "SauceCodeProNerdFontCompleteMono\ Nerd\ Font\ SemiBold"
