--
-- [[  plug-line  ]]: neovim底下那条bar，与vim-airline的效果类似。但与lualine-so-fancy.nvim能显示更多的有效信息。
--

-- * fancy lualine(lualine component 集大成者
--    - see [:h lualine-so-fancy.nvim.md] for help)
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "meuter/lualine-so-fancy.nvim",
    },
    opts = {
      options = {
        theme = "Forest",
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
        refresh = {
          statusline = 100,
        },
      },
      sections = {
        lualine_a = {
          { "fancy_mode", width = 6 },
        },
        lualine_b = {
          { "fancy_branch" },
        },
        lualine_c = {
          { "fancy_cwd",        substitute_home = true },
          { "fancy_lsp_servers" },
          { "navic",            color_correction = nil, navic_opts = nil },
          { "fancy_diagnostics" },
          { "fancy_diff" }, -- Show the changes of text in a file via icons.
        },
        lualine_x = {
          { "filetype" },
          { 'encoding' },
          { 'fileformat' },
        },
        lualine_y = {
          { 'lsp_progress' },
        },
        lualine_z = {
          { "progress" },
          {
            'datetime',
            style = '%R 󱑇 '
          },
        }

      },
    },
    event = "VimEnter",
  }
}
