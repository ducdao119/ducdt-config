return {
    "stevearc/conform.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                cs = { "csharpier" },
                ruby = { "rufo" },     -- hoặc "standardrb"
                html = { "injected" }, -- format vùng code Ruby nhúng trong HTML (ERB)
            },
            formatters = {
                injected = { options = { ignore_errors = false } },
                csharpier = {
                    command = vim.fn.expand("~/.dotnet/tools/csharpier"), -- dùng bản global
                },
            },
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 3000,
            },
        })

        -- Keymap
        vim.keymap.set({ "n", "v" }, "<leader>fm", function()
            conform.format({ async = true, lsp_fallback = true })
        end, { desc = "Format code" })
    end,
}
