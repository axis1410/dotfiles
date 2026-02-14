local o = vim.o
local wo = vim.wo
local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = " "

o.relativenumber = true
o.nu = true
o.cursorlineopt = "both"
o.cursorline = true
o.hlsearch = false
o.smartcase = true
o.ignorecase = true
o.termguicolors = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:block"
opt.isfname:append("@-@")
opt.updatetime = 50
opt.colorcolumn = "120"
opt.clipboard:append("unnamedplus")
opt.mouse = "a"
opt.splitbelow = true
opt.splitright = true