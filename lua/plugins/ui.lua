local keymaps = require "keymaps"
return {
    {
        "nvim-lualine/lualine.nvim",
        opts = function()
            return {
                theme = "everforest",
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
                        separator = true,
                    },
                },
                always_show_bufferline = false,
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            delay = 200,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" },
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = function()
            return {
                filters = {
                    dotfiles = false,
                },
                disable_netrw = true,
                hijack_netrw = true,
                hijack_cursor = true,
                hijack_unnamed_buffer_when_opening = false,
                sync_root_with_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_root = false,
                },
                view = {
                    adaptive_size = false,
                    side = "left",
                    width = 30,
                    preserve_window_proportions = true,
                },
                git = {
                    enable = false,
                    ignore = true,
                },
                filesystem_watchers = {
                    enable = true,
                },
                actions = {
                    open_file = {
                        resize_window = true,
                    },
                },
                renderer = {
                    root_folder_label = false,
                    highlight_git = false,
                    highlight_opened_files = "none",

                    indent_markers = {
                        enable = false,
                    },

                    icons = {
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = false,
                        },

                        glyphs = {
                            default = "󰈚",
                            symlink = "",
                            folder = {
                                default = "",
                                empty = "",
                                empty_open = "",
                                open = "",
                                symlink = "",
                                symlink_open = "",
                                arrow_open = "",
                                arrow_closed = "",
                            },
                            git = {
                                unstaged = "✗",
                                staged = "✓",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "★",
                                deleted = "",
                                ignored = "◌",
                            },
                        },
                    },
                },
            }
        end,
        keys = keymaps.nvim_tree,
        config = function(_, opts)
            require("nvim-tree").setup(opts)
            vim.g.nvimtree_side = opts.view.side
        end,
    },
}
