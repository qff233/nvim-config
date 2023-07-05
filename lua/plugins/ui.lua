return {
	"stevearc/dressing.nvim",
	"nvim-tree/nvim-web-devicons",

	{
		"NvChad/nvterm",
		config = true,
	},

	{
		"rcarriga/nvim-notify",
		opts = function()
			return require("plugins.configs.ui").notify
		end,
		config = function(_, opts)
			local notify = require("notify")
			notify.setup(opts)
			vim.notify = notify
		end,
	},

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
