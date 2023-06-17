vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>")
keymap.set("n", "<leader>q", "<cmd>q<cr>")
keymap.set("n", "<leader>ww", "<cmd>w<cr>")
keymap.set("n", "<leader>wq", "<cmd>wq<cr>")

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- bufferline
keymap.set("n", "H", "<cmd>BufferLineCyclePrev<cr>")
keymap.set("n", "L", "<cmd>BufferLineCycleNext<cr>")
keymap.set("n", "<leader>dh", "<cmd>BufferLineCloseLeft<cr>")
keymap.set("n", "1", "<cmd>BufferLineGoToBuffer 1<cr>")
keymap.set("n", "2", "<cmd>BufferLineGoToBuffer 2<cr>")
keymap.set("n", "3", "<cmd>BufferLineGoToBuffer 3<cr>")
keymap.set("n", "4", "<cmd>BufferLineGoToBuffer 4<cr>")
keymap.set("n", "5", "<cmd>BufferLineGoToBuffer 5<cr>")
keymap.set("n", "6", "<cmd>BufferLineGoToBuffer 6<cr>")
keymap.set("n", "7", "<cmd>BufferLineGoToBuffer 7<cr>")
keymap.set("n", "8", "<cmd>BufferLineGoToBuffer 8<cr>")
keymap.set("n", "9", "<cmd>BufferLineGoToBuffer 9<cr>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>lds", "<cmd>Telescope lsp_document_symbols<cr>")
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>")
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")

-- hop
keymap.set("n", "<leader>hw", ":HopWord<cr>")
keymap.set("n", "<leader>hww", ":HopWordMW<cr>")
keymap.set("n", "<leader>hc", ":HopChar2<cr>")
keymap.set("n", "<leader>hcc", ":HopChar2MW<cr>")
keymap.set("n", "<leader>hl", ":HopLine<cr>")
keymap.set("n", "<leader>hls", ":HopLineStart<cr>")

-- restart lsp server
keymap.set("n", "<leader>lr", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- troubles
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
