return {
    {
        "cbochs/grapple.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("grapple").setup({
                scope = "git_branch", -- hoặc "cwd", tùy bạn muốn gắn theo branch hay folder
            })

            -- Keymaps cơ bản
            vim.keymap.set("n", "<leader>a", function()
                require("grapple").tag()
            end, { desc = "Add or remove tag" })

            vim.keymap.set("n", "<leader>m", function()
                require("grapple").toggle_tags()
            end, { desc = "Toggle tags menu" })

            vim.keymap.set("n", "<leader>r", function()
                require("grapple").untag()
            end, { desc = "Remove tag" })

            vim.keymap.set("n", "<leader>1", function()
                require("grapple").select({ key = 1 })
            end, { desc = "Select tag 1" })

            vim.keymap.set("n", "<leader>2", function()
                require("grapple").select({ key = 2 })
            end, { desc = "Select tag 2" })

            vim.keymap.set("n", "<leader>3", function()
                require("grapple").select({ key = 3 })
            end, { desc = "Select tag 3" })

            vim.keymap.set("n", "<leader>4", function()
                require("grapple").select({ key = 4 })
            end, { desc = "Select tag 4" })
        end,
    },
}
