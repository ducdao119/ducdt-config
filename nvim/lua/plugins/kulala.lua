return {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    config = function()
        require("kulala").setup({
            -- KHÔNG bật global để tránh đụng keymap
            global_keymaps = false,
        })

        -- Keymaps local, rõ ràng
        vim.keymap.set("n", "<leader>rr", function()
            require("kulala").run()
        end, { desc = "Kulala: Run request" })

        vim.keymap.set("n", "<leader>ra", function()
            require("kulala").run_all()
        end, { desc = "Kulala: Run all requests" })

        vim.keymap.set("n", "<leader>rb", function()
            require("kulala").open_scratchpad()
        end, { desc = "Kulala: Open scratchpad" })
    end,
}
