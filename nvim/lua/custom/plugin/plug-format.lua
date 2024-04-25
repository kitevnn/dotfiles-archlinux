--
-- [[  plug-format  ]]: 快速格式化代码(需要安装格式化服务器，比如格式化lua就安装stylua)
--

return {
  {
    -- the other format plugin in neovim is 'nvim-lint'
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      require("conform").setup({
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*",
          callback = function(args)
            require("conform").format({ bufnr = args.buf })
          end,
        }),
        format_by_ft = {
          --
          -- [LINT-FORMAT]: Write the LS lint
          --
          lua = { "stylua" },
          C = { "clang_format" },
          Cpp = { "clang_format" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
    event = "InsertEnter",
  },
}
