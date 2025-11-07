return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {

                bind_to_cwd = false,

                follow_current_file = {
                    enabled = true, -- mới
                    update_root = false,
                },
                use_libuv_file_watcher = true,
            },
            window = {
                position = "left",
                mappings = {
                    -- Copy full path
                    ["cp"] = function(state)
                        local node = state.tree:get_node()
                        local path = node:get_id()
                        vim.fn.setreg("+", path)
                        vim.notify("📋 Copied full path: " .. path)
                    end,

                    -- Copy relative path
                    ["cr"] = function(state)
                        local node = state.tree:get_node()
                        local rel_path = vim.fn.fnamemodify(node:get_id(), ":.")
                        vim.fn.setreg("+", rel_path)
                        vim.notify("📋 Copied relative path: " .. rel_path)
                    end,

                    -- Copy filename only
                    ["cn"] = function(state)
                        local node = state.tree:get_node()
                        vim.fn.setreg("+", node.name)
                        vim.notify("📋 Copied filename: " .. node.name)
                    end,

                    -- Copy directory
                    ["cd"] = function(state)
                        local node = state.tree:get_node()
                        local dir = vim.fn.fnamemodify(node:get_id(), ":h")
                        vim.fn.setreg("+", dir)
                        vim.notify("📋 Copied directory: " .. dir)
                    end,
                },
            },
            default_component_configs = {
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "ﰊ",
                    default = "",
                },
                name = {
                    trailing_slash = false,
                },
            },
        })

        -- Toggle Neo-tree (không reveal file)
        vim.keymap.set("n", "<leader>n", ":Neotree toggle left reveal=false<CR>", { silent = true, noremap = true })
        -- Reveal file hiện tại khi cần
        vim.keymap.set("n", "<leader>e", ":Neotree reveal<CR>", { silent = true, noremap = true })
    end,
}
