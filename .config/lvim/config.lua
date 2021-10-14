-- General
-- =============================
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.leader = "space"
lvim.colorscheme = "onedarker"
lvim.line_wrap_cursor_movement = true
lvim.transparent_window = false

-- Additional Plugins
-- =============================
require("user.plugins").config()

-- Builtins
-- =============================
require("user.builtins").config()

-- Opts
-- =============================
require("user.opts").config()

-- LSP
-- =============================
lvim.lsp.automatic_servers_installation = true
lvim.lsp.document_highlight = true
lvim.lsp.code_lens_refresh = true
-- require("user.null_ls").config()
-- require("user.lsp").config()

-- Autocommands
-- =============================
-- require("user.autocommands").config()

-- Keys
-- =============================
require("user.keys").config()
