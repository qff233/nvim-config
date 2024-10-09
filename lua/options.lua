local opt = {
    showmode = false,
    number = true,

    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    autoindent = true,

    scrolloff = 10,
    cursorline = true,
    wrap = false,
    clipboard = function(clip)
        clip:append("unnamedplus")
    end,

    splitright = true,
    splitbelow = true,

    -- search
    ignorecase = true,
    smartcase = true,

    termguicolors = true,
    signcolumn = "yes",

    autoread = true,

    title = true,

    swapfile = false,
    backup = false,

    updatetime = 50,

    mouse = "a",

    undofile = true,
    undodir = vim.fn.expand("$HOME/.local/share/nvim/undo"),

    exrc = true,

    foldmethod = "expr",
    foldexpr = "v:lua.vim.treesitter.foldexpr()",
    foldlevelstart = 99
}

for key, value in pairs(opt) do
    if type(value) == "function" then
        value(vim.opt[key])
    else
        vim.opt[key] = value
    end
end

-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr =
--     vim.wo.
-- 重新打开恢复光标位置
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.fn.setpos(".", vim.fn.getpos("'\""))
            vim.cmd("silent! foldopen")
        end
    end,
})

-- 复制高亮
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    pattern = { "*" },
    callback = function()
        vim.highlight.on_yank({
            timeout = 300,
        })
    end,
})
