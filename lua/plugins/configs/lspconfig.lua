local M = {}

M.on_attach = function(client, bufnr)
    -- client.server_capabilities.documentFormattingProvider = false
    -- client.server_capabilities.documentRangeFormattingProvider = false
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', "<cmd>Lspsaga peek_definition<cr>", opts)
    vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<cr>", opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', "<cmd>Lspsaga show_line_diagnositcs<cr>", opts)
    vim.keymap.set('n', '<space>rn', "<cmd>Lspsaga rename<cr>", opts)
    vim.keymap.set('n', '<space>ca', "<cmd>Lspsaga code_action<cr>", opts)
    vim.keymap.set('n', 'gr', "<cmd>Lspsaga lsp_finder<cr>", opts)
    vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<cr>")
    vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<cr>")
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end
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
lspconfig.lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,

    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    [vim.fn.stdpath "data" .. "/lazy/extensions/nvchad_types"] = true,
                    [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
}

local util = require("lspconfig.util")
lspconfig.rust_analyzer.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    filetype = { "rust" },
    root_dir = util.root_pattern("Cargo.toml"),
    settings = {
        ['rust_analyzer'] = {
            cargo = {
                allFeatures = true,
            }
        }
    }
}

lspconfig.clangd.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
}
return M
