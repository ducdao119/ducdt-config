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
