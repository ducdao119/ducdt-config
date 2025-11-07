return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")

        -- Đăng ký thủ công standardrb làm formatter
        local standardrb = {
            name = "standardrb",
            method = null_ls.methods.FORMATTING,
            filetypes = { "ruby" },
            generator = null_ls.formatter({
                command = "standardrb",
                args = { "--fix", "--stdin", "$FILENAME", "--no-display-cop-names", "--no-display-style-guide" },
                to_stdin = true,
            }),
        }

        null_ls.setup({
            sources = {
                standardrb, -- formatter custom
                null_ls.builtins.formatting.rufo,
            },
            on_attach = function(client, bufnr)
                -- Auto format khi lưu file
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
        })

        -- Leader + fm để format thủ công
        vim.keymap.set("n", "<leader>fm", function()
            vim.lsp.buf.format({ async = true })
        end, { desc = "Format current file" })
    end,
}
