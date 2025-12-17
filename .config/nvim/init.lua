require("core.globals")
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

vim.loader.enable()

require("lazy").setup({
	require("plugins.statusline"),
	-- require("plugins.indentmini"),
	-- require("plugins.indent-blankline"),
	require("plugins.colorscheme"),
	-- require("plugins.staline"),
	require("plugins.treesitter"),
	require("plugins.lsp"),
	require("plugins.formatting"),
	require("plugins.autocomplete"),
	require("plugins.gitsigns"),
	-- require("plugins.plenary"),
	-- require("plugins.harpoon"),
	require("plugins.flash"),
	require("plugins.trouble"),
	require("plugins.snacks"),
	require("plugins.explorer"),
	-- require("plugins.yazi"),
	-- require("plugins.oil"),
	require("plugins.misc"),
	require("plugins.tw"),
	require("plugins.web-dev"),
	-- require("plugins.incline"),
	require("plugins.bufferline"),
	require("plugins.noice"),
	require("plugins.mini"),
	require("plugins.tabout"),
	require("plugins.lazygit"),
	require("plugins.diffview"),
	require("plugins.markdown"),
	-- require("plugins.markdown-viewer"),
	require("plugins.dashboard"),
	require("plugins.transparent"),
	require("plugins.log_highlight"),
	require("plugins.fzf"),
	-- require("plugins.neorg"),
	-- require("plugins.telescope"),
	-- require("plugins.motion"),
	-- require("plugins.which-key"),
})

local success, theme = pcall(require, "core.theme")
if success and theme then
	theme.set_theme()
end
