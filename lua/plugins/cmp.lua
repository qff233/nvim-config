return {
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	event = "InsertEnter",
	-- 	dependencies = {
	-- 		-- "onsails/lspkind.nvim",
	-- 		"hrsh7th/cmp-path",
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-buffer",
	-- 		-- "hrsh7th/cmp-nvim-lua",
	-- 		"hrsh7th/cmp-cmdline",
	-- 		{
	-- 			"saadparwaiz1/cmp_luasnip",
	-- 			dependencies = {
	-- 				"L3MON4D3/LuaSnip",
	-- 				dependencies = {
	-- 					"rafamadriz/friendly-snippets",
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	opts = function()
	-- 		local has_words_before = function()
	-- 			unpack = unpack or table.unpack
	-- 			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	-- 			return col ~= 0
	-- 				and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	-- 		end
	--
	-- 		require("luasnip.loaders.from_vscode").lazy_load()
	-- 		local cmp = require("cmp")
	-- 		local luasnip = require("luasnip")
	-- 		-- local lspkind = require("lspkind")
	-- 		return {
	-- 			snippet = {
	-- 				expand = function(args)
	-- 					require("luasnip").lsp_expand(args.body)
	-- 				end,
	-- 			},
	-- 			sources = {
	-- 				{ name = "nvim_lsp" },
	-- 				{ name = "buffer" },
	-- 				{ name = "path" },
	-- 				{ name = "luasnip" },
	-- 				-- { name = "nvim_lua" },
	-- 			},
	-- 			mapping = {
	-- 				["<Tab>"] = function(fallback)
	-- 					if cmp.visible() then
	-- 						cmp.select_next_item()
	-- 					elseif luasnip.expand_or_jumpable() then
	-- 						luasnip.expand_or_jump()
	-- 					elseif has_words_before() then
	-- 						cmp.complete()
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end,
	-- 				["<S-Tab>"] = function(fallback)
	-- 					if cmp.visible() then
	-- 						cmp.select_prev_item()
	-- 					elseif luasnip.jumpable(-1) then
	-- 						luasnip.jump(-1)
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end,
	-- 				["<C-u>"] = cmp.mapping.scroll_docs(-4),
	-- 				["<C-d>"] = cmp.mapping.scroll_docs(4),
	-- 				["<C-Space>"] = cmp.mapping.complete(),
	-- 				["<C-e>"] = cmp.mapping.abort(),
	-- 				["<CR>"] = cmp.mapping.confirm({ select = false }),
	-- 				["<S-CR>"] = cmp.mapping.confirm({
	-- 					behavior = cmp.ConfirmBehavior.Replace,
	-- 					select = false,
	-- 				}),
	-- 				["<C-CR>"] = function(fallback)
	-- 					cmp.abort()
	-- 					fallback()
	-- 				end,
	-- 			},
	-- 			-- formatting = {
	-- 			--     format = lspkind.cmp_format({
	-- 			--         mode = "symbol",
	-- 			--         maxwidth = 50,
	-- 			--         ellipsis_char = "...",
	-- 			--     }),
	-- 			-- },
	-- 			-- window = {
	-- 			-- 	completion = {
	-- 			-- 		winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
	-- 			-- 		scrollbar = true,
	-- 			-- 	},
	-- 			-- 	documentation = {
	-- 			-- 		winhighlight = "Normal:CmpDoc",
	-- 			-- 	},
	-- 			-- },
	-- 		}
	-- 	end,
	-- },
	--
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = {
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
		},

		-- use a release tag to download pre-built binaries
		version = "*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- See the full "keymap" documentation for information on defining your own keymap.
			keymap = {
				preset = "none",

				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },

				["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },

				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			},

            completion = {
                keyword = {
                    range = 'full'
                }
            },

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			cmdline = {
				enabled = true,
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
		opts_extend = { "sources.default" },
	},
}
