--
-- [[  plug-cmp  ]]: nvim-cmp补全提示窗口
--

-- see [:h nvim-cmp] for help.
return {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind-nvim'
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require('lspkind') -- lspkind make a hook for nvim-cmp.window
    -- +----------------------+
    -- | global configuration |
    -- +----------------------+

    cmp.setup({
      -- [NEW!]
      completion = {
        keyword_length = 1,
        keyword_pattern = [[\k\+]],
      },

      -- cmp-window configuration
      formatting = {
        -- fields = {'kind', 'abbr', 'menu'},
        format = lspkind.cmp_format({
          mode = 'symbol',
          maxwidth = function()
            return math.floor(0.15 * vim.o.columns)
          end,
          ellipsis_char = '  ',
          show_labelDetails = false,
          before = function(entry, vim_item)
            return vim_item
          end,
        })
      },

      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      window = {
        completion = {
          border = 'rounded',
          winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:FloatBorder,Search:FloatBorder',
          scrolloff = 0,
          scrollbar = nil,
          side_padding = 1,
        },
        documentation = {
          max_width = 40,
          max_height = 100,
        }
      },
      mapping = cmp.mapping.preset.insert({
        --  vim style
        -- ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-d>'] = cmp.mapping.scroll_docs(4),
        -- emacs style
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-j>'] = cmp.mapping.select_next_item(),                    -- the next
        ['<C-k>'] = cmp.mapping.select_prev_item(),                    -- the prev
        ['<C-l>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }), -- Show AutoComplete - Ctrl + l
        ['<C-h>'] = cmp.mapping.abort(),                               -- CANCEL AutoComplete - Ctrl + h
        ['<C-i>'] = cmp.mapping.confirm({ select = true }),            -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      }),

      -- Select the first words in nvim-cmp forever.
      completion = {
        completeopt = 'menu, menuone, noinsert, noselect',
      },
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = 'buffer' },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })



    -- +---------------------+
    -- | local configuration |
    -- +---------------------+
    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("lspconfig")['clangd'].setup {
      capabilities = capabilities,
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float),
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev),
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next),
      vim.keymap.set('n', '<leader>pq', vim.diagnostic.setloclist),
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

          -- apply the "fix available" from LSP-Server
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

          -- formatting lint setting
          vim.keymap.set('n', '<leader>ft', function()
            vim.lsp.buf.format { async = true }
          end, opts)

          -- workspace setting
          -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
          -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
          -- vim.keymap.set('n', '<leader>wl', function()
          --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          -- end, opts)
          --
          -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
          -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        end,
      })
    }

    require("lspconfig")['gopls'].setup {
      -- Prevent gopls from select keywords auto itself.
      preselect = {
        None = true,
      },
      capabilities = capabilities,
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float),
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev),
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next),
      vim.keymap.set('n', '<leader>pq', vim.diagnostic.setloclist),
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local opts = { buffer = ev.buf }

          -- new
          vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>ft', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    }

    require("lspconfig")['texlab'].setup {
      capabilities = capabilities,
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float),
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev),
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next),
      vim.keymap.set('n', '<leader>pq', vim.diagnostic.setloclist),
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local opts = { buffer = ev.buf }

          -- new
          vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>ft', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    }

    require("lspconfig")['lua_ls'].setup {
      capabilities = capabilities,
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float),
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev),
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next),
      vim.keymap.set('n', '<leader>pq', vim.diagnostic.setloclist),
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local opts = { buffer = ev.buf }

          -- new
          vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>ft', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    }

    require("lspconfig")['rust_analyzer'].setup {
      capabilities = capabilities,
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float),
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev),
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next),
      vim.keymap.set('n', '<leader>pq', vim.diagnostic.setloclist),
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local opts = { buffer = ev.buf }

          -- new
          vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>ft', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    }
  end,
}
