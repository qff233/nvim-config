return {
    {
        "nvim-lualine/lualine.nvim",
        opts = function()
            return {
                theme = "gruvbox"
            }
        end,
    },

    {
        "akinsho/bufferline.nvim",
        opts = {
            options = {
                mode = "tabs",
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true
                    }
                },
                always_show_bufferline = false,
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        }
        ,
    },

    {
        "xiyaowong/transparent.nvim",
        opts = function()
            return {
                extra_groups = {
                    "NvimTreeNormal",
                    "BufferLineTabClose",
                    "BufferLineFill",
                    "BufferLineBackground",
                    "BufferLineSeparator",
                    "BufferLineIndicatorSelected",
                }
            }
        end
    }
}
