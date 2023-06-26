require("options")
require("keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.g.everforest_diagnostic_line_highlight = 1
vim.cmd("colorscheme everforest")
vim.fn.sign_define({
    {
        name = "DiagnosticSignError",
        text = "E",
        texthl = "DiagnosticSignError",
        linehl = "ErrorLine"
    },
    {
        name = "DiagnosticSignWarn",
        text = "W",
        texthl = "DiagnosticSignWarn",
        linehl = "WarningLine"
    },
    {
        name = "DiagnosticSignInfo",
        text = "I",
        texthl = "DiagnosticSignInfo",
        linehl = "InfoLine"
    },
    {
        name = "DiagnosticSignHint",
        text = "H",
        texthl = "DiagnosticSignHint",
        linehl = "HintLine"
    }
})
