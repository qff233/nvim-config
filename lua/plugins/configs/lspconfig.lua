local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = false, buffer = bufnr }
    local keymap = require("keymaps").lsp_keymaps
    for i=1,#keymap do
        vim.keymap.set("n", keymap[i].from, keymap[i].to, opts)
    end
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format()
		end,
	})
	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("data") .. "/lazy/extensions/nvchad_types"] = true,
					[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

vim.g.everforest_diagnostic_line_highlight = 1
vim.fn.sign_define({
    {
        name = "DiagnosticSignError",
        text = "E",
        texthl = "DiagnosticSignError",
        linehl = "ErrorLine"
    },
    {
        name = "DiagnosticSignWarn",
        text = "W",
        texthl = "DiagnosticSignWarn",
        linehl = "WarningLine"
    },
    {
        name = "DiagnosticSignInfo",
        text = "I",
        texthl = "DiagnosticSignInfo",
        linehl = "InfoLine"
    },
    {
        name = "DiagnosticSignHint",
        text = "H",
        texthl = "DiagnosticSignHint",
        linehl = "HintLine"
    }
})

local util = require("lspconfig.util")
lspconfig.rust_analyzer.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
	filetype = { "rust" },
	root_dir = util.root_pattern("Cargo.toml"),
	settings = {
		["rust_analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
})

lspconfig.clangd.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

lspconfig.pyright.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
})

return M
