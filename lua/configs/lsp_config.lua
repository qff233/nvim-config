--     {
--         name = "DiagnosticSignError",
--         text = "E",
--         texthl = "DiagnosticSignError",
--         linehl = "ErrorLine"
--     },
--     {
--         name = "DiagnosticSignWarn",
--         text = "W",
--         texthl = "DiagnosticSignWarn",
--         linehl = "WarningLine"
--     },
--     {
--         name = "DiagnosticSignInfo",
--         text = "I",
--         texthl = "DiagnosticSignInfo",
--         linehl = "InfoLine"
--     },
--     {
--         name = "DiagnosticSignHint",
--         text = "H",
--         texthl = "DiagnosticSignHint",
--         linehl = "HintLine"
--     }
-- })

local util = require("lspconfig.util")
return {
	lua_ls = {
		settings = {
			Lua = {
				-- runtime = {
				-- 	path = { "?.lua", "?/init.lua" },
				-- 	pathStrict = true,
				-- 	version = "LuaJIT",
				-- },
				workspace = {
					checkThirdParty = false,
					-- library = {
					-- 	vim.env.VIMRUNTIME .. "/lua",
					-- 	vim.env.HOME .. "/.config/nvim/lua",
					-- 	vim.env.HOME .. "/.local/share/nvim/lazy",
					-- },
				},
				codeLens = {
					enable = true,
				},
				completion = {
					callSnippet = "Replace",
				},
				doc = {
					privateName = { "^_" },
				},
				hint = {
					enable = true,
					setType = false,
					paramType = true,
					paramName = "Disable",
					semicolon = "Disable",
					arrayIndex = "Disable",
				},
			},
		},
	},

	rust_analyzer = {
		filetype = { "rust" },
		root_dir = util.root_pattern("Cargo.toml"),
		settings = {
			["rust_analyzer"] = {
				imports = {
					granularity = {
						group = "module",
					},
					prefix = "self",
				},
				cargo = {
					buildScripts = {
						enable = true,
					},
				},
				procMacro = {
					enable = true,
				},
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},

	ts_ls = {
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = "/usr/lib/node_modules/@vue/typescript-plugin",
					languages = { "javascript", "typescript", "vue" },
				},
			},
		},
		filetypes = {
			"javascript",
			"typescript",
			"vue",
		},
	},
	jsonls = {
		settings = {
			json = {
				format = {
					enable = true,
				},
			},
		},
	},
	pyright = {},
	clangd = {},
}
