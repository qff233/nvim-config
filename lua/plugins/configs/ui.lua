local M = {}

M.lualine = {
    theme = "everforest"
}

M.bufferline = {
    options = {
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true
            }
        },
        always_show_bufferline = false
    },
}

return M
