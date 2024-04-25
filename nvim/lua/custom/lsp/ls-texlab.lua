--
-- [[  ls-texlab  ]]: (目前可利用nvim-lspconfig的配置，实现前搜，构建。后搜需要预览LaTeX的pdf工具支持才能实现)(需要安装texlab)
--

local util = require 'custom.util.util-lspconfig'

local texlab_build_status = vim.tbl_add_reverse_lookup {
  Success = 0,
  Error = 1,
  Failure = 2,
  Cancelled = 3,
}

local texlab_forward_status = vim.tbl_add_reverse_lookup {
  Success = 0,
  Error = 1,
  Failure = 2,
  Unconfigured = 3,
}

local function buf_build(bufnr)
  bufnr = util.validate_bufnr(bufnr)
  local texlab_client = util.get_active_client_by_name(bufnr, 'texlab')
  local pos = vim.api.nvim_win_get_cursor(0)
  local params = {
    textDocument = { uri = vim.uri_from_bufnr(bufnr) },
    position = { line = pos[1] - 1, character = pos[2] },
  }
  if texlab_client then
    texlab_client.request('textDocument/build', params, function(err, result)
      if err then
        error(tostring(err))
      end
      print('Build ' .. texlab_build_status[result.status])
    end, bufnr)
  else
    print 'method textDocument/build is not supported by any servers active on the current buffer'
  end
end

local function buf_search(bufnr)
  bufnr = util.validate_bufnr(bufnr)
  local texlab_client = util.get_active_client_by_name(bufnr, 'texlab')
  local pos = vim.api.nvim_win_get_cursor(0)
  local params = {
    textDocument = { uri = vim.uri_from_bufnr(bufnr) },
    position = { line = pos[1] - 1, character = pos[2] },
  }
  if texlab_client then
    texlab_client.request('textDocument/forwardSearch', params, function(err, result)
      if err then
        error(tostring(err))
      end
      print('Search ' .. texlab_forward_status[result.status])
    end, bufnr)
  else
    print 'method textDocument/forwardSearch is not supported by any servers active on the current buffer'
  end
end

-- bufnr isn't actually required here, but we need a valid buffer in order to
-- be able to find the client for buf_request.
-- TODO find a client by looking through buffers for a valid client?
-- local function build_cancel_all(bufnr)
--   bufnr = util.validate_bufnr(bufnr)
--   local params = { token = "texlab-build-*" }
--   lsp.buf_request(bufnr, 'window/progress/cancel', params, function(err, method, result, client_id)
--     if err then error(tostring(err)) end
--     print("Cancel result", vim.inspect(result))
--   end)
-- end

return {
  default_config = {
    cmd = {
      "texlab"
    },
    filetypes = {
      "tex", "plaintex", "bib"
    },
    root_dir = util.root_pattern('.git', '.latexmkrc', '.texlabroot', 'texlabroot', 'Tectonic.toml'),
    settings = {
      texlab = {
        auxDirectory = ".",
        bibtexFormatter = "texlab",
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
          executable = "latexmk",
          forwardSearchAfter = false,
          onSave = false,
        },
        chktex = {
          onEdit = false,
          onOpenAndSave = false
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        forwardSearch = {
          args = {}
        },
        latexFormatter = "latexindent",
        latexindent = {
          modifyLineBreaks = false
        },
      },
    },
    single_file_supprt = true,
  },
  commands = {
    TexlabBuild = {
      function()
        buf_build(0)
      end,
      description = 'Build the current buffer',
    },
    TexlabForward = {
      function()
        buf_search(0)
      end,
      description = 'Forward search from current position',
    },
  },
}
