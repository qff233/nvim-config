local M = {}

M.lualine = {
    theme = "gruvbox"
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

M.transparent = {
    extra_groups = {
        "NvimTreeNormal",
        "BufferLineTabClose",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
    }
}

return M
