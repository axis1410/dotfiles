require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.opt.termguicolors = true

-- Optimize Neovim startup
vim.loader.enable()

require("lazy").setup({
	require("plugins.lualine"),
	require("plugins.colorscheme"),
	require("plugins.bufferline"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"), 
	require("plugins.formatting"),
	require("plugins.autocomplete"),
	require("plugins.gitsigns"),
	require("plugins.plenary"),
	require("plugins.harpoon"),
	require("plugins.transparent"),
	require("plugins.flash"),
	require("plugins.trouble"),
	require("plugins.snacks"),
	require("plugins.yazi"),
	require("plugins.misc"),     -- Contains vim-fugitive and other utilities
	require("plugins.lazygit"),  -- LazyGit integration
	require("plugins.tw"),       -- Tailwind CSS colors
	require("plugins.web-dev"),  -- Web development tools including nvim-ts-autotag
	
	-- Lightweight alternatives
	require("plugins.mini"),    -- mini.nvim provides lightweight alternatives to many plugins
	
	-- Optional plugins, uncomment if needed
	-- require("plugins.noice"),
	-- require("plugins.explorer"),
	-- require("plugins.neotree"),
	-- require("plugins.dashboard"),
	-- require("plugins.none-ls"),
	-- require("plugins.indent-blankline"),
	-- require("plugins.comments"),
	-- require("plugins.autopairs"),
	-- require("plugins.smear"),
	-- require("plugins.navic"),
	-- require("plugins.linter"),
	-- require("plugins.errorlens"),
	-- require("plugins.pyvenv"),
	-- require("plugins.fidget"),
	-- require("plugins.markdown"),
})

local success, theme = pcall(require, "core.theme")
if success and theme then
	theme.set_theme()
end

