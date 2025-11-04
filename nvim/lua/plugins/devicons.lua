return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup {
      -- tùy chỉnh icon nếu muốn
      override = {},
      default = true,
    }
  end,
}

