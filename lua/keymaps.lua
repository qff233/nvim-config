local M = {}

vim.g.mapleader = " "
M.nvim_tree = {
	{ "<leader>e", "<cmd> NvimTreeToggle <cr>" },
}

M.trouble = {
	{ "<leader>xx", "<cmd> TroubleToggle workspace_diagnostics <cr>" },
}

local keymap = {
	{ "<leader>q", "<cmd> q <cr>" },
	{ "<leader>ww", "<cmd> w <cr>" },
	{ "<leader>wq", "<cmd> wq <cr>" },
	{ "<Esc>", "<cmd> noh <cr>" },

	-- telescope
	{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
	{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>" },

	-- telescope git
	{ "<leader>gc", "<cmd>Telescope git_commits<cr>" }, -- list all git commits (use <cr> to checkout) ["gc" for git commits]
	{ "<leader>gb", "<cmd>Telescope git_branches<cr>" }, -- list git branches (use <cr> to checkout) ["gb" for git branch]
	{ "<leader>gs", "<cmd>Telescope git_status<cr>" }, -- list current changes per file with diff preview ["gs" for git status]

	--buffer line
	{ "te", "<cmd> :tabedit <cr>" },
	{ "<tab>", "<cmd> :tabnext <cr>" },
	{ "<s-tab>", "<cmd> :tabprev <cr>" },
	{ "td", "<cmd> bdel <cr>" },
}

M.lsp_keymaps = {
	{ from = "gD", to = vim.lsp.buf.declaration },
	{ from = "gd", to = "<cmd>Lspsaga peek_definition<cr>" },
	{ from = "K", to = "<cmd>Lspsaga hover_doc<cr>" },
	{ from = "gi", to = vim.lsp.buf.implementation },
	{ from = "<C-k>", to = vim.lsp.buf.signature_help },
	{ from = "<leader>D", to = "<cmd>Lspsaga show_line_diagnositcs<cr>" },
	{ from = "<leader>rn", to = "<cmd>Lspsaga rename<cr>" },
	{ from = "<leader>ca", to = "<cmd>Lspsaga code_action<cr>" },
	{ from = "gr", to = "<cmd>Lspsaga lsp_finder<cr>" },
	{ from = "[d", to = "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
	{ from = "]d", to = "<cmd>Lspsaga diagnostic_jump_next<cr>" },
}

for i = 1, #keymap do
	local config = keymap[i]
	vim.keymap.set(config.mode or "n", config[1], config[2])
end

return M
