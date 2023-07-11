return {
	"stevearc/dressing.nvim",
	"nvim-tree/nvim-web-devicons",

	{
		"nvim-lualine/lualine.nvim",
		opts = function()
			return require("plugins.configs.ui").lualine
		end,
	},

	{
		"akinsho/bufferline.nvim",
		opts = function()
			return require("plugins.configs.others").bufferline
		end,
	},
}
