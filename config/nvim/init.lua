vim.opt.swapfile = false

-- lazy.nvim
require("config.lazy")

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
    vim.cmd("colorscheme habamax.nvim")

-- nvim-lspconfig
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('vimls')
    vim.lsp.enable('html')
    vim.lsp.enable('cssls')
    vim.lsp.enable('pyright')
    vim.lsp.enable('ts_ls')
end
