return {
    {
        "Mofiqul/dracula.nvim",
        name = "dracula",
        config = function()
            local dracula = require("dracula")
            dracula.setup({
                show_end_of_buffer = false, -- ẩn ký tự ~ ở cuối file
                transparent_bg = false,     -- tắt nền trong suốt
                italic_comment = true,      -- comment nghiêng
                overrides = {},
            })
            vim.cmd.colorscheme("dracula")
        end,
    }
}
