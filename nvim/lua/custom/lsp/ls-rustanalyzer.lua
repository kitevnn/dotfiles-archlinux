--
-- [[  ls-rustanalyzer  ]]: Rust 的 LanugageServer(需要安装rust_analyzer通过rustup)
--

return {
  default_config = {
    settings = {
      ['rust-analyzer'] = {
        diagnostics = {
          enable = false,
        },
      },
    },
    cmd = {
      "rust-analyzer"
    },
    filetypes = {
      "rust"
    },
    single_file_support = true, -- start ra in a single file instead of a "directory" project.
  }
}
