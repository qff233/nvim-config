return {

	"nvim-lua/plenary.nvim",
	"sainnhe/everforest",
	"nvim-tree/nvim-web-devicons",
	"christoomey/vim-tmux-navigator",
	"stevearc/dressing.nvim",
	"SmiteshP/nvim-navic",

	{
		"NvChad/nvterm",
		config = true,
	},
	{
		"j-hui/fidget.nvim",
		requires = { "neovim/nvim-lspconfig" },
		tag = "legacy",
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
		"williamboman/mason.nvim",
		opts = function()
			return require("plugins.configs.mason")
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = true,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.configs.null-ls")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("plugins.configs.others").luasnip(opts)
				end,
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			---@diagnostic disable-next-line: different-requires
			return require("plugins.configs.cmp")
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function(_, opts)
			require("Comment").setup(opts)
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
		"nvim-telescope/telescope.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = function()
			return require("plugins.configs.telescope")
		end,
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

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
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

	{
		"xiyaowong/transparent.nvim",
		opts = function()
			return require("plugins.configs.ui").transparent
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
