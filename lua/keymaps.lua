local M = {}

vim.g.mapleader = " "
local keymap = {
    { from = "<c-h>",       to = "<Left>",                                        mode = "i" },
    { from = "<c-j>",       to = "<Down>",                                        mode = "i" },
    { from = "<c-k>",       to = "<Up>",                                          mode = "i" },
    { from = "<c-l>",       to = "<Right>",                                       mode = "i" },
    { from = "<leader>q",   to = "<cmd> q <cr>" },
    { from = "<leader>ww",  to = "<cmd> w <cr>" },
    { from = "<leader>wq",  to = "<cmd> wq <cr>" },
    { from = "<Esc>",       to = "<cmd> noh <cr>" },

    { from = "<leader>e",   to = "<cmd> NvimTreeToggle <cr>" },
    { from = "<leader>xx",  to = "<cmd> TroubleToggle workspace_diagnostics <cr>" },

    -- telescope
    { from = "<leader>ff",  to = "<cmd>Telescope find_files<cr>" },
    { from = "<leader>fs",  to = "<cmd>Telescope live_grep<cr>" },
    { from = "<leader>fc",  to = "<cmd>Telescope grep_string<cr>" },
    { from = "<leader>fb",  to = "<cmd>Telescope buffers<cr>" },
    { from = "<leader>fh",  to = "<cmd>Telescope help_tags<cr>" },
    { from = "<leader>lds", to = "<cmd>Telescope lsp_document_symbols<cr>" },

    -- telescope git
    { from = "<leader>gc",  to = "<cmd>Telescope git_commits<cr>" },  -- list all git commits (use <cr> to checkout) ["gc" for git commits]
    { from = "<leader>gb",  to = "<cmd>Telescope git_branches<cr>" }, -- list git branches (use <cr> to checkout) ["gb" for git branch]
    { from = "<leader>gs",  to = "<cmd>Telescope git_status<cr>" },   -- list current changes per file with diff preview ["gs" for git status]

    --buffer line
    { from = "H",           to = "<cmd> bprevious <cr>" },
    { from = "L",           to = "<cmd> bnext<cr>" },
    { from = "X",           to = "<cmd> bdel <cr> <cmd> bnext <cr>" },
}

M.lsp_keymaps = {
    { from = "gD",         to = vim.lsp.buf.declaration },
    { from = "gd",         to = "<cmd>Lspsaga peek_definition<cr>" },
    { from = "K",          to = "<cmd>Lspsaga hover_doc<cr>" },
    { from = "gi",         to = vim.lsp.buf.implementation },
    { from = "<C-k>",      to = vim.lsp.buf.signature_help },
    { from = "<leader>D",  to = "<cmd>Lspsaga show_line_diagnositcs<cr>" },
    { from = "<leader>rn", to = "<cmd>Lspsaga rename<cr>" },
    { from = "<leader>ca", to = "<cmd>Lspsaga code_action<cr>" },
    { from = "gr",         to = "<cmd>Lspsaga lsp_finder<cr>" },
    { from = "[d",         to = "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
    { from = "]d",         to = "<cmd>Lspsaga diagnostic_jump_next<cr>" },
}


for i = 1, #keymap do
    local config = keymap[i]
    vim.keymap.set(config.mode or "n", config.from, config.to)
end

return M
