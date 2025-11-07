return {
    -- UI nâng cấp cho cmdline, popup…
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },

        config = function()
            ----------------------------------------------------------------------
            -- ✅ nvim-notify
            ----------------------------------------------------------------------
            local notify = require("notify")
            notify.setup({
                background_colour = "#1e1e2e", -- nền trong suốt đẹp, hết warning
                stages = "fade_in_slide_out",
                timeout = 800,
                fps = 60,
                render = "minimal",

                max_width = 60, -- số ký tự
                -- max_height = 8,
                wrap = true,
                -- top_down = false
            })
            vim.notify = notify

            ----------------------------------------------------------------------
            -- ✅ Noice
            ----------------------------------------------------------------------
            require("noice").setup({
                cmdline = {
                    enabled = true,
                    view = "cmdline_popup",
                    format = {
                        cmdline = { pattern = "^:", icon = "", lang = "vim" },
                        search_down = { pattern = "^/", icon = " ", lang = "regex" },
                        search_up = { pattern = "^%?", icon = " ", lang = "regex" },
                        lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
                    },
                },

                messages = {
                    enabled = true,
                    view = "notify",
                    view_error = "notify",
                    view_warn = "notify",
                },

                popupmenu = {
                    enabled = true,
                    backend = "nui",
                },

                notify = {
                    enabled = true,
                    view = "notify",
                },

                lsp = {
                    progress = { enabled = false, view = "mini" },
                    hover = { enabled = true },
                    signature = {
                        enabled = true,
                        auto_open = {
                            enabled = true,
                            trigger = true,
                            throttle = 50,
                        },
                    },
                    message = { enabled = true, view = "notify" },
                },

                presets = {
                    bottom_search = false,
                    command_palette = false,
                    lsp_doc_border = false,
                },
            })
        end,
    },
}
