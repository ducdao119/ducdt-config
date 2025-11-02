return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"java",
				"json",
				"zig",
				-- thêm hai ngôn ngữ này
				"c_sharp",
				"ruby",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

