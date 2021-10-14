local M = {}

M.config = function()
  -- Add your own keymapping
  -- keymappings [view all the defaults by pressing <leader>Lk]
  -- ============================
  -- lvim.keys.normal_mode["<C-Up>"] = ""
  lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
  -- X closes a buffer
  lvim.keys.normal_mode["<S-x>"] = ":BufferClose<CR>"
  -- use the default vim behavior for H and L
  -- lvim.keys.normal_mode["<S-l>"] = nil
  -- lvim.keys.normal_mode["<S-h>"] = nil
  -- vim.opt.scrolloff = 0 -- Required so L moves to the last line
end

return M
