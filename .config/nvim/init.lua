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

require("lazy").setup({
	require("plugins.lualine"),
	-- require("plugins.explorer"),
	require("plugins.noice"),
	-- require("plugins.dashboard"),
	-- require("plugins.neotree"),
	-- require("plugins.none-ls"),
	-- require("plugins.indent-blankline"),
	require("plugins.colorscheme"),
	require("plugins.bufferline"),
	require("plugins.treesitter"),
	require("plugins.telescope"),

	require("plugins.lsp"), -- TODO: Remove Comment Later
	require("plugins.formatting"), -- TODO: Remove Comment Later
	require("plugins.autocomplete"),
	require("plugins.gitsigns"),
	require("plugins.misc"),
	require("plugins.comments"),
	require("plugins.mini"),
	require("plugins.plenary"),
	require("plugins.harpoon"),
	require("plugins.transparent"),
	require("plugins.tw"),
	require("plugins.autopairs"),
	require("plugins.web-dev"),
	-- require("plugins.smear"),
	-- require("plugins.navic"),
	require("plugins.trouble"),
	require("plugins.snacks"),
	-- require("plugins.linter"),
	-- require("plugins.errorlens"),
	-- require("plugins.pyvenv"),
	-- require("plugins.fidget"),
	require("plugins.flash"),

	-- require("plugins.markdown"),
})

local success, theme = pcall(require, "core.theme")
if success and theme then
	theme.set_theme()
end
