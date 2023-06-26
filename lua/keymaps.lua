vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "<c-h>", "<Left>")
keymap.set("i", "<c-j>", "<Down>")
keymap.set("i", "<c-k>", "<Up>")
keymap.set("i", "<c-l>", "<Right>")

keymap.set("n", "<leader>q", "<cmd> q <cr>")
keymap.set("n", "<leader>w", "<cmd> w <cr>")
keymap.set("n", "<leader>wq", "<cmd> wq <cr>")
keymap.set("n", "<Esc>", "<cmd> noh <cr>")

keymap.set("n", "<leader>e", "<cmd> NvimTreeToggle <cr>")
keymap.set("n", "<leader>tl", "<cmd> TroubleToggle workspace_diagnostics <cr>")
