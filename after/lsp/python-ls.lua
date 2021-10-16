lsp_config = require('lsp.lsp-config')
local util = require('lspconfig/util')
local path = util.path

-- We need to set up the virtual env when using poetry like this, because of the following bug:
-- This was copy pasted -- see GitHub issue https://github.com/neovim/nvim-lspconfig/issues/500
-- https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-876700701
-- https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-877293306
local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv via poetry in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
    return path.join(venv, 'bin', 'python')
  end

  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

local on_init = function(client)
  client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
end

-- npm i -g pyright
require'lspconfig'.pyright.setup {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "off", -- this needs to be turned off if Django type stubs are not installed
        extraPaths = {
          "~/KOG/kog/data_apps",
          "~/KOG/kog/api_apps",
          "~/KOG/kog/gui_apps",
          "~/KOG/kog",
        }
      }
    }
  },
  on_attach = lsp_config.on_attach,
  on_init = on_init,
  flags = {
    debounce_text_changes = 150,
  }
}

