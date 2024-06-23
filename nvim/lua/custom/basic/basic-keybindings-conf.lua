--
-- [[  basic keybindings  ]]: 快捷键表格
--

-- keybindings
nnoremap('s', '<nop>')
nnoremap('S', '<cmd>w<CR>')
nnoremap('Q', '<cmd>q<CR>')
nnoremap('<C-b>', '<cmd>w<CR>')
nnoremap('<C-q>', '<cmd>q<CR>')
nnoremap('sj', '<cmd>set splitbelow<CR><cmd>split<CR>')
nnoremap('sk', '<cmd>set nosplitbelow<CR><cmd>split<CR>')
nnoremap('sh', '<cmd>set nosplitright<CR><cmd>vsplit<CR>')
nnoremap('sl', '<cmd>set splitright<CR><cmd>vsplit<CR>')
nnoremap('J', '5j')
nnoremap('K', '5k')
vnoremap('J', '5j')
vnoremap('K', '5k')
nnoremap('<leader><leader>I', '<cmd>LazySync<CR>')
nnoremap('<down>', '<cmd>res -5<CR>')
nnoremap('<up>', '<cmd>res +5<CR>')
nnoremap('<right>', '<cmd>vertical res -5<CR>')
nnoremap('<left>', '<cmd>vertical res +5<CR>')

-- plus
tnoremap('<ESC><ESC>', '<C-\\><C-N>')
inoremap('<C-e>', '<C-k>');
vnoremap('<leader>S', 'y/<C-R>"<CR>');

-- clipboard
vnoremap('<leader>C', '"+y')
nnoremap('<leader>P', '"+p')

-- quick move
nnoremap("[w", ":m -1-. v:count1<CR>")
nnoremap("]w", ":m +. v:count1<CR>")
vnoremap("]w", ":m'>+1<CR>gv=gv")
vnoremap("[w", ":m'>-2<CR>gv=gv")

-- indent blankline
nnoremap('<leader>il', '<cmd>IBLDisable<CR>');

-- lsp
nnoremap('<leader>pt', '<cmd>LspStart texlab<CR>')
nnoremap('<leader>pc', '<cmd>LspStart clangd<CR>')
nnoremap('<leader>pl', '<cmd>LspStart lua_ls<CR>')
nnoremap('<leader>pg', '<cmd>LspStart gopls<CR>')
nnoremap('<leader>pr', '<cmd>LspStart rust_analyzer<CR>')
nnoremap('<leader>l', '<cmd>LspStop<CR>');
-- nnoremap('<leader>pt', '<cmd>LspStart typst-lsp<CR>')

-- lsp command
nnoremap('<leader>ot', '<cmd>TexlabBuild<CR>')

-- breadcrumb
nnoremap('<leader>b', '<cmd>lua require("barbecue.ui").toggle()<CR>')

-- workspace
nnoremap('<leader>wl', '<cmd>WorkspacesList<CR>')
nnoremap('<leader>wa', '<cmd>WorkspacesAdd<CR>')
nnoremap('<leader>wo', '<cmd>WorkspacesOpen<CR>')
nnoremap('<leader>wm', '<cmd>WorkspacesRemove<CR>')
nnoremap('<leader>wr', '<cmd>WorkspacesRename<CR>')
-- nnoremap('<leader>wma', '<cmd>WorkspacesAddDir<CR>')
-- nnoremap('<leader>wml', '<cmd>WorkspacesListDirs<CR>')
-- nnoremap('<leader>wms', '<cmd>WorkspacesSyncDirs<CR>')
-- nnoremap('<leader>wmr', '<cmd><cmd>WorkspacesRemoveDir<CR>')

-- glow
nnoremap('<leader>yp', '<cmd>Glow<CR>')
nnoremap('<leader>yx', '<cmd>Glow!<CR>')

-- typst
nnoremap('<leader>yt', '<cmd>TypstPreviewToggle<CR>')

-- git chunk
nnoremap("[h", "<cmd>require('gitsigns').next_hunk()")
nnoremap("]h", "<cmd>require('gitsigns').prev_hunk()")
nnoremap("<leader>gh", "<cmd>require('gitsigns').setloclist()")
nnoremap("<leader>gv", "<cmd>require('gitsigns').select_hunk()")

-- telescope
nnoremap('<leader>ff', '<cmd>Telescope find_files<CR>')
nnoremap('<leader>fg', '<cmd>Telescope live_grep<CR>')
nnoremap('<leader>fb', '<cmd>Telescope buffers<CR>')
nnoremap('<leader>ft', '<cmd>Telescope help_tags<CR>')

-- bufferline
nnoremap("<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>")
nnoremap("<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>")
nnoremap("<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>")
nnoremap("<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>")
nnoremap("<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>")
nnoremap("<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>")
nnoremap("<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>")
nnoremap("<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>")
nnoremap("<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>")
nnoremap("<leader>xx", "<cmd>BufferLinePickClose<CR>")
nnoremap("<leader>xh", "<cmd>BufferLineCloseLeft<CR>")
nnoremap("<leader>xl", "<cmd>BufferLineCloseRight<CR>")

-- outline
nnoremap('<leader>s', '<cmd>Outline<CR>') -- v3

-- tree
nnoremap('M', '<cmd>NvimTreeToggle<CR><C-w>l')

-- paste
nnoremap('<leader>e', '<cmd>set paste<CR>')
nnoremap('<leader>E', '<cmd>set nopaste<CR>')

-- term
nnoremap('<leader>tt', '<cmd>FloatermToggle<CR>')
