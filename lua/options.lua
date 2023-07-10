local opt = {
    number = true,

    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    autoindent = true,

    scrolloff = 15,
    cursorline = true,
    wrap = false,
    clipboard = function(clip) clip:append("unnamedplus") end,

    splitright = true,
    splitbelow = true,

    ignorecase = true,
    smartcase = true,

    termguicolors = true,
    signcolumn = "yes",
}

for key, value in pairs(opt) do
    if type(value) == "function" then
        value(vim.opt[key])
    else
        vim.opt[key] = value
    end
end
