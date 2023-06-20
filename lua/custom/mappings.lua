local M = {}

M.gerenal = {
	n = {
		["<leader>q"] = { "<cmd> :q <CR>", "quit the window" },
		["<leader>w"] = { "<cmd> :w <CR>", "save the file" },
		["<leader>wq"] = { "<cmd> :wq <CR>", "save and quit the window" },
	},
}

M.nvimtree = {
	n = {
		-- toggle
		["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
		["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
	},
}

M.trouble = {
	n = {
		["<leader>tw"] = { "<cmd>TroubleToggle workspace_diagnostics <CR>", "show workspace trouble list" },
	},
}

return M
