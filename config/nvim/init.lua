vim.opt.virtualedit = "onemore"
vim.opt.swapfile = false

if not vim.g.vscode then
    vim.scriptencoding = "utf-8"
    vim.opt.encoding = "utf-8"
    vim.opt.fileencoding = "utf-8"
    vim.opt.number = true
    vim.opt.autoindent = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.hls = true
    vim.opt.list = true
    vim.opt.listchars = { tab = ">-", trail = "-" }
    vim.opt.completeopt = "menuone"
    vim.opt.termguicolors = true
    vim.cmd[[colorscheme habamax]]
end

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

plugins = require("plugins")

require("lazy").setup(plugins, {
    performance = {
        rtp = {
            disabled_plugins = {
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
            }
        }
    },
    install = {
        colorscheme = { "habamax" }
    }
})

