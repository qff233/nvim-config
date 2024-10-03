return {
	{
		"williamboman/mason.nvim",
		opts = function()
			return {
				ui = {
					icons = {
						package_pending = " ",
						package_installed = "󰄳 ",
						package_uninstalled = " 󰚌",
					},
				},

				max_concurrent_installers = 10,
			}
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
			require("configs.lspconfig")
		end,
	},

	{
		"nvimdev/guard.nvim",
		dependencies = {
			"nvimdev/guard-collection",
		},
		config = function()
			local status, guard = pcall(require, "guard")
			if not status then
				vim.notify("not found guard")
				return
			end

			local ft = require("guard.filetype")

			ft("c"):fmt("clang-format")
			ft("cpp"):fmt("clang-format")
			ft("typescript,javascript,typescriptreact"):fmt("prettier")
			ft("lua"):fmt("lsp"):append("stylua"):lint("selene")
			ft("sh"):fmt("shfmt")
			ft("rust"):fmt("rustfmt")
			-- ft("python"):fmt("black"):append("isort")

			guard.setup({
				-- the only options for the setup function
				fmt_on_save = true,
				-- Use lsp if no formatter was defined for this filetype
				lsp_as_default_formatter = true,
			})
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
				opts = { history = true, delete_check_events = "TextChanged" },
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
				"onsails/lspkind.nvim",
			},
		},
		opts = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
			local function has_words_before()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end
			return {
				completion = {
					completeopt = "menu,menuone,noselect",
				},

				window = {
					completion = {
						winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
						scrollbar = true,
					},
					documentation = {
						winhighlight = "Normal:CmpDoc",
					},
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
				mapping = {
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-u>"] = cmp.mapping.scroll_docs(-5),
					["<C-d>"] = cmp.mapping.scroll_docs(5),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() and cmp.get_active_entry() then
								cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
							else
								fallback()
							end
						end,
						s = cmp.mapping.confirm({ select = true }),
						c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					}),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "nvim_lua" },
					{ name = "path" },
				},
			}
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = { icons = false },
	},

	{
		"j-hui/fidget.nvim",
		requires = { "neovim/nvim-lspconfig" },
		tag = "legacy",
		config = true,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		-- opts = function()
		--     return {
		--         show_current_context = true,
		--     }
		-- end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function()
			return {
				ensure_installed = {
					"bash",
					"rust",
					"cpp",
					"c",
					"html",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"typescript",
					"yaml",
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			}
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
