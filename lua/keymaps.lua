local M = {}

vim.g.mapleader = " "

M.nvim_tree = {
    { "<leader>e", "<cmd> NvimTreeToggle <cr>" },
}

-- M.trouble = {
--     { "<leader>xx", "<cmd> TroubleToggle workspace_diagnostics <cr>" },
-- }

M.lsp_keymaps = {
    { "gD",         vim.lsp.buf.declaration },
    { "gd",         "<cmd>Telescope lsp_definitions<cr>" },
    { "K",          "<cmd>Lspsaga hover_doc<cr>" },
    { "gi",         vim.lsp.buf.implementation },
    { "<C-k>",      vim.lsp.buf.signature_help },
    { "<leader>D",  "<cmd>Telescope diagnostics<cr>" },
    { "<leader>rn", "<cmd>Lspsaga rename ++project<cr>" },
    { "<leader>ca", "<cmd>Lspsaga code_action<cr>" },
    { "gr",         "<cmd>Telescope lsp_references<cr>" },
    { "[d",         "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
    { "]d",         "<cmd>Lspsaga diagnostic_jump_next<cr>" },
    { "<leader>cf", vim.lsp.buf.format }
}

local keymap = {
    { "<leader>q",       "<cmd> q <cr>" },
    { "<leader>ww",      "<cmd> w <cr>" },
    { "<leader>wq",      "<cmd> wq <cr>" },
    { "<Esc>",           "<cmd> noh <cr>" },

    -- telescope
    { "<leader>ff",      "<cmd>Telescope find_files<cr>" },
    { "<leader><space>", "<cmd>Telescope buffers<cr>" },
    { "<leader>fg",      "<cmd>Telescope live_grep<cr>" },
    { "<leader>fs",      "<cmd>Telescope lsp_document_symbols<cr>" },

    -- telescope git
    { "<leader>gc",      "<cmd>Telescope git_commits<cr>" },  -- list all git commits (use <cr> to checkout) ["gc" for git commits]
    { "<leader>gb",      "<cmd>Telescope git_branches<cr>" }, -- list git branches (use <cr> to checkout) ["gb" for git branch]
    { "<leader>gs",      "<cmd>Telescope git_status<cr>" },   -- list current changes per file with diff preview ["gs" for git status]

    --buffer line
    { "te",              "<cmd> :tabedit <cr>" },
    { "<tab>",           "<cmd> :tabnext <cr>" },
    { "<s-tab>",         "<cmd> :tabprev <cr>" },
    { "td",              "<cmd> bdel <cr>" },
}

for i = 1, #keymap do
    local config = keymap[i]
    vim.keymap.set(config.mode or "n", config[1], config[2])
end

return M
