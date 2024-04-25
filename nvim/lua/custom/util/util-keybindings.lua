--
-- [[  util-keybindings  ]]: 一个我自己模仿vim的mapping设置的lua函数工具库
--

-- <noremap><silent>
function noremap(mode, shortcut, command)
  local api = vim.api
  api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nnoremap(shortcut, command)
  noremap('n', shortcut, command)
end

function inoremap(shortcut, command)
  noremap('i', shortcut, command)
end

function vnoremap(shortcut, command)
  noremap('v', shortcut, command)
end

function cnoremap(shortcut, command)
  noremap('c', shortcut, command)
end

function tnoremap(shortcut, command)
  noremap('t', shortcut, command)
end

-- <silent>
function map(mode, shortcut, command)
  local api = vim.api
  api.nvim_set_keymap(mode, shortcut, command, { noremap = false, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end
