local opt = {
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
