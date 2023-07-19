return {
	"nvim-lua/plenary.nvim",
	-- "sainnhe/everforest",
	"morhetz/gruvbox",
	"christoomey/vim-tmux-navigator",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function(_, opts)
			---@diagnostic disable-next-line: different-requires
			local telescope = require("telescope")
			telescope.setup(opts)

			-- load extensions
			-- for _, ext in ipairs(opts.extensions_list) do
			--     telescope.load_extension(ext)
			-- end
		end,
	},
}
