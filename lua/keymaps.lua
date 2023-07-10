vim.g.mapleader = " "
local keymap = {
    {from = "<c-h>", to = "<Left>", mode = "i"},
    {from = "<c-i>", to = "<Down>", mode = "i"},
    {from = "<c-k>", to = "<Up>", mode = "i"},
    {from = "<c-l>", to = "<Right>", mode = "i"},

    {from = "<leader>q", to = "<cmd> q <cr>"},
    {from = "<leader>ww", to = "<cmd> w <cr>"},
    {from = "<leader>wq", to = "<cmd> wq <cr>"},
    {from = "<Esc>", to = "<cmd> noh <cr>"},

    {from = "<leader>e", to = "<cmd> NvimTreeToggle <cr>"},
    {from = "<leader>tl", to = "<cmd> TroubleToggle workspace_diagnostics <cr>"},
    
    -- telescope
    {from = "<leader>ff", to = "<cmd>Telescope find_files<cr>"},
    {from = "<leader>fs", to = "<cmd>Telescope live_grep<cr>"},
    {from = "<leader>fc", to = "<cmd>Telescope grep_string<cr>"},
    {from = "<leader>fb", to = "<cmd>Telescope buffers<cr>"},
    {from = "<leader>fh", to = "<cmd>Telescope help_tags<cr>"},
    {from = "<leader>lds", to = "<cmd>Telescope lsp_document_symbols<cr>"},

    -- telescope git
    {from = "<leader>gc", to = "<cmd>Telescope git_commits<cr>"},   -- list all git commits (use <cr> to checkout) ["gc" for git commits]
    {from = "<leader>gb", to = "<cmd>Telescope git_branches<cr>"},  -- list git branches (use <cr> to checkout) ["gb" for git branch]
    {from = "<leader>gs", to = "<cmd>Telescope git_status<cr>"},    -- list current changes per file with diff preview ["gs" for git status]

    --buffer line
    {from = "H", to = "<cmd> bprevious <cr>"},
    {from = "L", to = "<cmd> bnext<cr>"},
    {from = "X", to = "<cmd> bdel <cr> <cmd> bnext <cr>"},

    -- terminal
    {from = "<A-h>", to = function() require("nvterm.terminal").toggle("horizontal") end},
    {from = "<A-v>", to = function() require("nvterm.terminal").toggle("vertical") end},
    {from = "<C-x>", to = "<C-\\><C-N>", mode = "t"},
}

for i=1,#keymap do
    local config = keymap[i]
    vim.keymap.set(config.mode or "n", config.from, config.to)
end

