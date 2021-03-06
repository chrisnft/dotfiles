local M = {}

M.config = function ()
  -- Generic LSP settings
  --===================================
  -- you can set a custom on_attach function that will be used for all the language servers
  -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
  -- lvim.lsp.on_attach_callback = function(client, bufnr)
  --   local function buf_set_option(...)
  --     vim.api.nvim_buf_set_option(bufnr, ...)
  --   end
  --   --Enable completion triggered by <c-x><c-o>
  --   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  -- end

  -- you can overwrite the null_ls setup table (useful for setting the root_dir function)
  -- lvim.lsp.null_ls.setup = {
  --   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
  -- }

  -- or if you need something more advanced
  -- lvim.lsp.null_ls.setup.root_dir = function(fname)
  --   if vim.bo.filetype == "javascript" then
  --     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
  --       or require("lspconfig/util").path.dirname(fname)
  --   elseif vim.bo.filetype == "php" then
  --     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
  --   else
  --     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
  --   end
  -- end
  --
  --
end

return M
