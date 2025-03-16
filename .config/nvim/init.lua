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

require("lazy").setup({
	require("plugins.dashboard"),
	-- require("plugins.alpha"),
	require("plugins.neotree"),
	require("plugins.colorscheme"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.autocomplete"),
	require("plugins.none-ls"),
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
	require("plugins.formatting"),
	require("plugins.smear"),
	require("plugins.snacks"),
	require("plugins.navic"),
})

local success, theme = pcall(require, "core.theme")
if success and theme then
	theme.set_theme()
end
