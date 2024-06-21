-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = {
    number = true,
    relativenumber = false,

    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    autoindent = true,

    scrolloff = 10,
    cursorline = true,

    splitright = true,
    splitbelow = true,

    ignorecase = true,
    smartcase = true,

    termguicolors = true,
    signcolumn = "yes",

    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
    foldenable = false,
}

for key, value in pairs(opt) do
    if type(value) == "function" then
        value(vim.opt[key])
    else
        vim.opt[key] = value
    end
end
