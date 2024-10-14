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
				workspace = {
					checkThirdParty = false,
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
				checkOnSave = {
					command = "clippy",
				},
				cargo = {
					allFeatures = true,
				},
			},
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
