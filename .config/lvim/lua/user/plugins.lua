local M = {}

M.config = function()
  lvim.plugins = {
    {
      -- "ChristianChiarulli/vim-solidity",
      "ilya-bobyr/vim-solidity",
    },
    { "lunarvim/colorschemes" },
    { "folke/tokyonight.nvim" },
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("lsp_signature").on_attach()
      end,
      event = "InsertEnter",
    },
    {
      "sindrets/diffview.nvim",
      event = "BufRead",
    },
    {
      "tpope/vim-fugitive",
      cmd = {
        "G",
        "Git",
        "Gdiffsplit",
        "Gread",
        "Gwrite",
        "Ggrep",
        "GMove",
        "GDelete",
        "GBrowse",
        "GRemove",
        "GRename",
        "Glgrep",
        "Gedit",
      },
      ft = { "fugitive" },
    },
    {
      "windwp/nvim-ts-autotag",
      event = "InsertEnter",
    },
    {
      "p00f/nvim-ts-rainbow",
    },
    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
    },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "ethanholz/nvim-lastplace",
      event = "BufRead",
      config = function()
        require("nvim-lastplace").setup({
          lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
          lastplace_ignore_filetype = {
            "gitcommit",
            "gitrebase",
            "svn",
            "hgcommit",
          },
          lastplace_open_folds = true,
        })
      end,
    },
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      ft = "markdown",
      config = function()
        vim.g.mkdp_auto_start = 1
      end,
    },
    {
      "folke/todo-comments.nvim",
      event = "BufRead",
    },
    {
      "metakirby5/codi.vim",
      cmd = "Codi",
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      setup = function()
        vim.g.indentLine_enabled = 1
        vim.g.indent_blankline_char = "▏"
        vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
        vim.g.indent_blankline_buftype_exclude = { "terminal" }
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = false
      end,
    },
    {
      "tpope/vim-surround",
      keys = { "c", "d", "y" },
    },
    { "tpope/vim-repeat" },
    -- { "ludovicchabant/vim-gutentags" },
    {
      "rmagatti/goto-preview",
      config = function()
        require("goto-preview").setup({
          width = 120, -- Width of the floating window
          height = 25, -- Height of the floating window
          default_mappings = false, -- Bind default mappings
          debug = false, -- Print debug information
          opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
          post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
          -- You can use "default_mappings = true" setup option
          -- Or explicitly set keybindings
          -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
          -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
          -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
        })
      end,
    },
    -- 	{
    -- 		"tzachar/cmp-tabnine",
    -- 		config = function()
    -- 			local tabnine = require("cmp_tabnine.config")
    -- 			tabnine:setup({
    -- 				max_lines = 1000,
    -- 				max_num_results = 20,
    -- 				sort = true,
    -- 			})
    -- 		end,

    -- 		run = "./install.sh",
    -- 		requires = "hrsh7th/nvim-cmp",
    -- 	},
  }
end

return M
