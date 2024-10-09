-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem = {
--     documentationFormat = { "markdown", "plaintext" },
--     snippetSupport = true,
--     preselectSupport = true,
--     insertReplaceSupport = true,
--     labelDetailsSupport = true,
--     deprecatedSupport = true,
--     commitCharactersSupport = true,
--     tagSupport = { valueSet = { 1 } },
--     resolveSupport = {
--         properties = {
--             "documentation",
--             "detail",
--             "additionalTextEdits",
--         },
--     },
-- }

-- vim.fn.sign_define({
--     {
--         name = "DiagnosticSignError",
--         text = "E",
--         texthl = "DiagnosticSignError",
--         linehl = "ErrorLine"
--     },
--     {
--         name = "DiagnosticSignWarn",
--         text = "W",
--         texthl = "DiagnosticSignWarn",
--         linehl = "WarningLine"
--     },
--     {
--         name = "DiagnosticSignInfo",
--         text = "I",
--         texthl = "DiagnosticSignInfo",
--         linehl = "InfoLine"
--     },
--     {
--         name = "DiagnosticSignHint",
--         text = "H",
--         texthl = "DiagnosticSignHint",
--         linehl = "HintLine"
--     }
-- })

local util = require("lspconfig.util")
return {
    lua_ls = {
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace",
                },
                workspace = { checkThirdParty = false },
                telemetry = { enable = false }
            },
        }
    },

    rust_analyzer = {
        filetype = { "rust" },
        root_dir = util.root_pattern("Cargo.toml"),
        settings = {
            ["rust_analyzer"] = {
                cargo = {
                    allFeatures = true,
                },
            },
        },
    },

    pyright = {},
    clangd = {},
}
