--
-- [[  ls-clangd  ]]: C/Cpp 的 LanugageServer(还没有全部配置完毕，没配置完的结果是，在一些链接过程上会有点小问题)(需要安装clang)
--

local default_capabilities = {
  textDocument = {
    completion = {
      editsNearCursor = true,
    },
  },
  offsetEncoding = {'utf-8', 'utf-16'},
}

local root_files = {
  '.clangd',
  '.clang-tidy',
  '.clang-format',
  'compile_commands.json',
  'compile_flags.txt',
  'configure.ac',       -- AutoTools
}

return {
  default_config = {
    cmd = {
      "clangd"
    },
    filetypes = {
      -- link to clangd depends on filetype.
      "c", "cpp", "objc", "objcpp", "cuda", "proto"
    },
    root_dir = function(fname)
      return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    end,
    single_file_support = true,
    capabilities = default_capabilities,
  },
}

