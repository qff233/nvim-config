local treesitter = require 'nvim-treesitter.configs'
treesitter.setup {
    highlight = {
        enable = true,
    },
    -- enable indentation
    indent = { enable = true, disable = { "python" } },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },
    -- ensure these language parsers are installed
    ensure_installed = {
        "cpp",
        "rust",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
    },
    -- auto install above language parsers
    auto_install = true,
}
