local M = {}

M.config = function()
  -- Core plugins are in lvim.builtin
  -- Press tab to view options
  -- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
  -- ===========================================
  lvim.builtin.lualine.active = true
  lvim.builtin.dashboard.active = true
	lvim.builtin.dashboard.custom_section["m"] = {
    description = { "  Marks              " },
    command = "Telescope marks",
  }
  lvim.builtin.bufferline.active = true
  lvim.builtin.terminal.active = true

	-- Dap
  -- plugin nvim-dap is debug adapter protocol
	-- ===========================================
  lvim.builtin.dap.active = true

	-- Treesiter
	-- ===========================================
  lvim.builtin.nvimtree.setup.view.side = "left"
  lvim.builtin.nvimtree.show_icons.git = 0
	lvim.builtin.treesitter.context_commentstring.enable = true
  lvim.builtin.treesitter.ignore_install = { "haskell" }
  lvim.builtin.treesitter.highlight.enabled = true
  lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } } -- treesitter is buggy :(
  lvim.builtin.treesitter.matchup.enable = true
  -- lvim.treesitter.textsubjects.enable = true
  -- lvim.treesitter.playground.enable = true
  lvim.builtin.treesitter.query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  }
	-- Add markdown and solidity support
  lvim.builtin.treesitter.on_config_done = function()
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.solidity = {
      install_info = {
        url = "https://github.com/JoranHonig/tree-sitter-solidity",
        files = { "src/parser.c" },
        requires_generate_from_grammar = true,
      },
      filetype = "solidity",
    }
    parser_config.jsonc.used_by = "json"
    parser_config.markdown = {
      install_info = {
        url = "https://github.com/ikatyang/tree-sitter-markdown",
        files = { "src/parser.c", "src/scanner.cc" },
      },
    }
  end
  -- if you don't want all the parsers change this to a table of the ones you want
	-- For languages: https://github.com/nvim-treesitter/nvim-treesitter
  lvim.builtin.treesitter.ensure_installed = {
    "json",
    "bash",
    "lua",
    "yaml",
    "javascript",
    "dockerfile",
    "graphql",
    "css",
    "html",
    "python",
    "vim",
    "typescript",
    "tsx",
		-- "solidity",
		-- "markdown"
    -- "dot",
    -- "go",
    -- "rust",
    -- "c_sharp",
    -- "cpp",
    -- "cmake",
    -- "java",
  }

	-- CMP
	-- https://github.com/hrsh7th/nvim-cmp
	-- ===========================================
	-- Autocomplete
  -- lvim.builtin.cmp.autocomplete = true
	-- lvim.builtin.cmp.sources = {
	--     { name = "nvim_lsp" },
	--     { name = "cmp_tabnine", max_item_count = 3 },
	--     { name = "buffer", max_item_count = 5 },
	--     { name = "path", max_item_count = 5 },
	--     { name = "luasnip", max_item_count = 3 },
	--     { name = "nvim_lua" },
	--     { name = "calc" },
	--     { name = "emoji" },
	--     { name = "treesitter" },
	--     { name = "crates" },
	--   }
	-- lvim.builtin.cmp.experimental = {
	--     ghost_text = false,
	--     native_menu = false,
	--     custom_menu = true,
	--   }
	--   lvim.builtin.cmp.formatting.kind_icons = require("user.lsp.lsp_kind").symbols()
	--   lvim.builtin.cmp.formatting.source_names = {
	--     buffer = "(Buffer)",
	--     nvim_lsp = "(LSP)",
	--     luasnip = "(Snip)",
	--     treesitter = " ",
	--     nvim_lua = "(NvLua)",
	--     spell = " 暈",
	--     emoji = "  ",
	--     path = "  ",
	--     calc = "  ",
	--     cmp_tabnine = "  ",
	--   }
	-- CMP mappings
	local cmp = require "cmp"
  local luasnip = require "luasnip"
  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end
  lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), '')
    elseif check_backspace() then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
    else
      fallback()
    end
  end
  lvim.builtin.cmp.mapping["<S-Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), '')
    else
      fallback()
    end
  end
  lvim.builtin.cmp.mapping["<CR>"] = function(fallback)
    if vim.bo.filetype == "tex" then
      lvim.builtin.cmp.confirm_opts.select = false
    else
      lvim.builtin.cmp.confirm_opts.select = true
    end
    if not cmp.confirm(lvim.builtin.cmp.confirm_opts) then
      if luasnip.jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-next", true, true, true), '')
      else
        fallback()
      end
    end
	end

	-- Telescope
	-- ===========================================
  -- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
  -- lvim.builtin.telescope.on_config_done = function()
  --   local actions = require "telescope.actions"
  --   -- for input mode
  --   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  --   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  --   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  --   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  --   -- for normal mode
  --   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  --   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
  -- end

  -- Use which-key to add extra bindings with the leader-key prefix
  -- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
  -- lvim.builtin.which_key.mappings["t"] = {
  --   name = "+Trouble",
  --   r = { "<cmd>Trouble lsp_references<cr>", "References" },
  --   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  --   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
  --   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  --   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  --   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
  -- }
end

return M
