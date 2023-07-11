return {
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = function()
			return require("plugins.configs.others").indent_blankline
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function()
			return require("plugins.configs.treesitter")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = function()
			return require("plugins.configs.others").gitsigns
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = function()
			return require("plugins.configs.nvimtree")
		end,
		config = function(_, opts)
			require("nvim-tree").setup(opts)
			vim.g.nvimtree_side = opts.view.side
		end,
	},

	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
		},
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},

}
