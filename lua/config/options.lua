-- luacheck: globals vim
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true

vim.opt.wrap = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.fillchars:append({ eob = " " })

vim.opt.termguicolors = true

vim.opt.clipboard:append("unnamedplus")
vim.opt.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.g.mapleader = " "
