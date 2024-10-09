return {
	"SmiteshP/nvim-navic",
	"christoomey/vim-tmux-navigator",
	"stevearc/dressing.nvim",
	"nvim-tree/nvim-web-devicons",
	{
		"neanias/everforest-nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("everforest").setup({
				transparent_background_level = 1,
			})
		end,
	},
}
