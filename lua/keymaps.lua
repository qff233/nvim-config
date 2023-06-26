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

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")            -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")             -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")           -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")               -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")             -- list available help tags
keymap.set("n", "<leader>lds", "<cmd>Telescope lsp_document_symbols<cr>") -- list all functions/structs/classes/modules in the current buffers

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")  -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")   -- list current changes per file with diff preview ["gs" for git status]

keymap.set("n", "H", "<cmd> bprevious <cr>")
keymap.set("n", "L", "<cmd> bnext <cr>")
keymap.set("n", "X", "<cmd> bdel <cr>")
