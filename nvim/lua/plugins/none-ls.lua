return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,
				-- JS / TS / HTML / JSON
				null_ls.builtins.formatting.prettier,
				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				-- ✅ C#
				null_ls.builtins.formatting.csharpier,
				-- ✅ Ruby (Rufo)
				null_ls.builtins.formatting.rufo,
			},
		})

		-- Phím tắt format nhanh
		vim.keymap.set("n", "<leader>fm", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "Format current file" })
	end,
}
