return {
	{
		"neovim/nvim-lspconfig",
		commit = "8ab8f4cf48425dcb4845a61d3caa2d2a7e3d9df7",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neoconf.nvim",
			"folke/lazydev.nvim",
			"glepnir/lspsaga.nvim",
		},
		config = function()
			require("neoconf").setup()
			require("lazydev").setup()
			require("lspsaga").setup()
			require("mason").setup({
				ui = {
					icons = {
						package_pending = " ",
						package_installed = "󰄳 ",
						package_uninstalled = " 󰚌",
					},
				},

				max_concurrent_installers = 10,
			})
			local on_attach = function(client, bufnr)
				local opts = { noremap = false, buffer = bufnr }
				local keymap = require("keymaps").lsp_keymaps
				for i = 1, #keymap do
					vim.keymap.set("n", keymap[i][1], keymap[i][2], opts)
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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local capabilities = vim.lsp.protocol.make_client_capabilities()
			local servers = require("configs/lsp_config")
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
			})
			for server, config in pairs(servers) do
				require("lspconfig")[server].setup(vim.tbl_deep_extend("keep", {
					on_attach = on_attach,
					capabilities = capabilities,
				}, config))
			end
		end,
	},
	--
	-- {
	-- 	"folke/trouble.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	opts = { icons = false },
	-- 	keys = keymaps.trouble,
	-- },

	{
		"j-hui/fidget.nvim",
		requires = { "neovim/nvim-lspconfig" },
		tag = "legacy",
		config = true,
	},
}
