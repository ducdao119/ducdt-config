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
            incremental_selection = { enable = true },
            textobjects = {
                select = { enable = true },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = { [']m'] = '@function.outer' },
                    goto_next_end = { [']M'] = '@function.outer' },
                    goto_previous_start = { ['[m'] = '@function.outer' },
                    goto_previous_end = { ['[M'] = '@function.outer' },
                },
            },
        })
    end,
}
