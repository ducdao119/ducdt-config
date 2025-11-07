-- pull lazy vim
vim.env.PATH = vim.env.PATH .. ':/home/ducdt/.local/share/gem/ruby/3.3.0/bin'
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- Auto save when close insert mode
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    pattern = "*",
    command = "silent! write"
})

-- install plugins and options
require("vim-options")
require("floating-term")
require("floating-git")
require("lazy").setup("plugins", lazy_opts)
