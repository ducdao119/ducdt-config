return {
    -- ⚡ FZF-LUA: dùng cho toàn bộ file, grep, buffer
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local fzf = require("fzf-lua")

            fzf.setup({
                winopts = {
                    -- 🎨 Layout & border giống Telescope
                    height = 0.9,
                    width = 0.85,
                    row = 0.1,
                    col = 0.5,
                    border = "rounded",
                    fullscreen = false,

                    -- 📜 Preview giống Telescope (bên phải)
                    preview = {
                        layout = "vertical",
                        vertical = "down:45%",
                        horizontal = "right:50%",
                        title = true,
                        scrollbar = false,
                    },

                    -- 🌈 Màu Dracula style
                    hls = {
                        normal = "Normal",
                        border = "FloatBorder",
                        title = "Title",
                        cursor = "Cursor",
                        search = "Search",
                        header = "Bold",
                    },
                },

                -- 🔧 Các command
                files = {
                    prompt = "🔍 Files ❯ ",
                    cwd_prompt = false,
                    git_icons = true,
                    file_icons = true,
                    color_icons = true,
                    previewer = true,
                },

                grep = {
                    prompt = "📖 Grep ❯ ",
                    input_prompt = "Grep for ❯ ",
                    rg_opts = "--column --line-number --no-heading --color=always --smart-case",
                    file_icons = true,
                    color_icons = true,
                },

                keymap = {
                    builtin = {
                        ["<C-f>"] = "toggle-preview",
                        ["<C-d>"] = "preview-page-down",
                        ["<C-u>"] = "preview-page-up",
                    },
                    fzf = {
                        ["tab"] = "toggle+down",
                        ["shift-tab"] = "toggle+up",
                    },
                },
            })
            -- 🔍 Keymap fzf-lua
            vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
            vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep" })
            vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
            vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help Tags" })
        end,
    },

    -- 🧠 TELESCOPE: chỉ cho LSP actions + UI select
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope", -- chỉ load khi dùng
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    layout_config = {
                        horizontal = { preview_width = 0.6, width = 0.85 },
                        vertical = { preview_height = 0.6, height = 0.85 },
                    },
                    file_ignore_patterns = { "%.class", "node_modules", ".git/" },
                },
            })

            local builtin = require("telescope.builtin")

            -- 🔧 Dùng Telescope chỉ cho LSP
            vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "LSP References" })
            vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to Definition" })
            vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Go to Implementation" })
            vim.keymap.set("n", "gy", builtin.lsp_type_definitions, { desc = "Go to Type Definition" })
            vim.keymap.set("n", "<leader>ld", builtin.diagnostics, { desc = "Project Diagnostics" })
            vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Document Symbols" })
        end,
    },

    -- 🎨 UI select
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = require("telescope.themes").get_dropdown({
                        layout_config = { width = 0.5 },
                    }),
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
