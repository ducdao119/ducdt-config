return {

    -- Endwise for Ruby (via Treesitter)
    { "RRethy/nvim-treesitter-endwise" },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require('nvim-autopairs').setup({
                check_ts = true,
                ts_config = {
                    ruby = { 'string', 'tag' }, -- tự động đóng string + tag trong Ruby
                    lua  = { 'string' }
                }
            })
        end
    },

    -- LSP & CMP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim",          config = function() require("mason").setup() end },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/vim-vsnip" }, -- snippet engine`

}
