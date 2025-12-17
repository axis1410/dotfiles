local M = {}

function M.setup()
	-- Define colors
	local colors = {
		bg = "#000000",
		bg_alt = "#010101",
		bg_darker = "#0a0a0a",
		fg = "#dce3ea",
		fg_dark = "#454d54",
		fg_darker = "#34393e",
		pink = "#f75f8f",
		blue = "#43aaf9",
		blue_light = "#a7d1f5",
		green = "#62c073",
		green_light = "#b7f0e5",
		purple = "#b267e6",
		purple_light = "#d7c9f0",
		red = "#e61f44",
		white = "#dce3ea",
		comment = "#888888",
		black = "#000000",
		transparent = "NONE",
	}

	-- Clear any existing highlights
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	-- Set theme name
	vim.g.colors_name = "midnight_noir"

	-- Helper function to set highlight
	local function hi(group, opts)
		local options = {}
		if opts.fg then
			options.fg = opts.fg
		end
		if opts.bg then
			options.bg = opts.bg
		end
		if opts.sp then
			options.sp = opts.sp
		end
		if opts.style and opts.style ~= "NONE" then
			if type(opts.style) == "string" then
				options.bold = opts.style:find("bold")
				options.italic = opts.style:find("italic")
				options.underline = opts.style:find("underline")
				options.undercurl = opts.style:find("undercurl")
			end
		end
		vim.api.nvim_set_hl(0, group, options)
	end

	-- Editor highlights
	local editor_syntax = {
		-- Editor UI elements
		Normal = { fg = colors.fg, bg = colors.bg },
		NormalFloat = { fg = colors.fg, bg = colors.bg_darker },
		FloatBorder = { fg = colors.fg_dark, bg = colors.bg_darker },
		Cursor = { fg = colors.bg, bg = colors.fg },
		CursorLine = { bg = "#00000022" },
		CursorLineNr = { fg = colors.fg, bg = colors.bg },
		LineNr = { fg = colors.fg_dark },
		SignColumn = { fg = colors.fg, bg = colors.bg },
		ColorColumn = { bg = colors.bg_darker },
		Conceal = { fg = colors.fg_dark },
		EndOfBuffer = { fg = colors.fg_dark },
		VertSplit = { fg = colors.fg_dark, bg = colors.bg },
		Title = { fg = colors.fg, style = "bold" },
		NonText = { fg = colors.fg_darker },

		-- Popup menu
		Pmenu = { fg = colors.fg, bg = colors.bg_darker },
		PmenuSel = { fg = colors.fg, bg = colors.pink, style = "bold" },
		PmenuSbar = { bg = colors.bg_darker },
		PmenuThumb = { bg = colors.fg_dark },

		-- Search and Selection
		Search = { fg = colors.bg, bg = colors.blue },
		IncSearch = { fg = colors.bg, bg = colors.pink },
		Visual = { bg = colors.blue .. "55" },
		VisualNOS = { bg = colors.blue .. "55" },

		-- Errors and warnings
		Error = { fg = colors.red },
		ErrorMsg = { fg = colors.red },
		WarningMsg = { fg = colors.white },

		-- Diff
		DiffAdd = { fg = colors.green },
		DiffChange = { fg = colors.white },
		DiffDelete = { fg = colors.red },
		DiffText = { fg = colors.blue },

		-- Folds
		Folded = { fg = colors.fg_dark, bg = colors.bg_darker },
		FoldColumn = { fg = colors.fg_dark, bg = colors.bg },

		-- Status line
		StatusLine = { fg = colors.fg, bg = colors.bg },
		StatusLineNC = { fg = colors.fg_dark, bg = colors.bg },
		WildMenu = { fg = colors.fg, bg = colors.pink },

		-- Tab line
		TabLine = { fg = colors.fg, bg = colors.bg_darker },
		TabLineFill = { fg = colors.fg, bg = colors.bg },
		TabLineSel = { fg = colors.fg, bg = colors.bg },

		-- Spell checking
		SpellBad = { sp = colors.red, style = "undercurl" },
		SpellCap = { sp = colors.blue, style = "undercurl" },
		SpellRare = { sp = colors.purple, style = "undercurl" },
		SpellLocal = { sp = colors.green, style = "undercurl" },

		-- Diagnostics
		DiagnosticError = { fg = colors.red },
		DiagnosticWarn = { fg = colors.white },
		DiagnosticInfo = { fg = colors.blue },
		DiagnosticHint = { fg = colors.purple },
		DiagnosticUnderlineError = { sp = colors.red, style = "undercurl" },
		DiagnosticUnderlineWarn = { sp = colors.white, style = "undercurl" },
		DiagnosticUnderlineInfo = { sp = colors.blue, style = "undercurl" },
		DiagnosticUnderlineHint = { sp = colors.purple, style = "undercurl" },

		-- LSP
		LspReferenceText = { bg = colors.blue .. "22" },
		LspReferenceRead = { bg = colors.blue .. "22" },
		LspReferenceWrite = { bg = colors.blue .. "22" },
		LspSignatureActiveParameter = { fg = colors.pink },
	}

	-- Syntax highlighting
	local syntax = {
		-- Basic syntax
		Comment = { fg = colors.comment, style = "italic" },
		Constant = { fg = colors.blue },
		String = { fg = colors.green },
		Character = { fg = colors.blue },
		Number = { fg = colors.white },
		Boolean = { fg = colors.blue },
		Float = { fg = colors.white },
		Identifier = { fg = colors.fg },
		Function = { fg = colors.purple },
		Statement = { fg = colors.pink, style = "italic" },
		Conditional = { fg = colors.pink, style = "italic" },
		Repeat = { fg = colors.pink, style = "italic" },
		Label = { fg = colors.pink },
		Operator = { fg = colors.blue },
		Keyword = { fg = colors.pink, style = "italic" },
		Exception = { fg = colors.pink, style = "italic" },

		-- PreProc group
		PreProc = { fg = colors.pink },
		Include = { fg = colors.pink, style = "italic" },
		Define = { fg = colors.pink },
		Macro = { fg = colors.pink },
		PreCondit = { fg = colors.pink },

		-- Type group
		Type = { fg = colors.white, style = "italic" },
		StorageClass = { fg = colors.pink, style = "italic" },
		Structure = { fg = colors.blue },
		Typedef = { fg = colors.pink },

		-- Special group
		Special = { fg = colors.blue },
		SpecialChar = { fg = colors.blue },
		Tag = { fg = colors.green },
		Delimiter = { fg = colors.fg },
		SpecialComment = { fg = colors.comment, style = "italic" },
		Debug = { fg = colors.red },

		-- Other
		Underlined = { style = "underline" },
		Ignore = { fg = colors.fg_dark },
		Todo = { fg = colors.purple, style = "bold,italic" },
	}

	-- Tree-sitter highlights
	local treesitter = {
		-- Misc
		["@comment"] = { link = "Comment" },
		["@error"] = { link = "Error" },
		["@none"] = { fg = colors.fg },
		["@preproc"] = { link = "PreProc" },
		["@define"] = { link = "Define" },
		["@operator"] = { link = "Operator" },

		-- Punctuation
		["@punctuation.bracket"] = { fg = colors.fg },
		["@punctuation.delimiter"] = { fg = colors.fg },
		["@punctuation.special"] = { fg = colors.fg },

		-- Literals
		["@string"] = { link = "String" },
		["@string.regex"] = { fg = colors.green },
		["@string.escape"] = { fg = colors.green },
		["@string.special"] = { fg = colors.green },
		["@character"] = { link = "Character" },
		["@character.special"] = { fg = colors.green },
		["@boolean"] = { link = "Boolean" },
		["@number"] = { link = "Number" },
		["@float"] = { link = "Float" },

		-- Functions
		["@function"] = { fg = colors.purple },
		["@function.builtin"] = { fg = colors.white },
		["@function.call"] = { fg = colors.purple },
		["@function.macro"] = { fg = colors.purple },
		["@method"] = { fg = colors.purple },
		["@method.call"] = { fg = colors.purple },
		["@constructor"] = { fg = colors.blue },
		["@parameter"] = { fg = colors.fg },

		-- Keywords
		["@keyword"] = { fg = colors.pink, style = "italic" },
		["@keyword.function"] = { fg = colors.pink, style = "italic" },
		["@keyword.operator"] = { fg = colors.pink },
		["@keyword.return"] = { fg = colors.pink, style = "italic" },
		["@conditional"] = { link = "Conditional" },
		["@repeat"] = { link = "Repeat" },
		["@debug"] = { link = "Debug" },
		["@label"] = { link = "Label" },
		["@include"] = { link = "Include" },
		["@exception"] = { link = "Exception" },

		-- Types
		["@type"] = { fg = colors.white },
		["@type.builtin"] = { fg = colors.white, style = "italic" },
		["@type.definition"] = { fg = colors.white },
		["@type.qualifier"] = { fg = colors.pink },
		["@storageclass"] = { link = "StorageClass" },
		["@attribute"] = { fg = colors.purple },
		["@field"] = { fg = colors.fg },
		["@property"] = { fg = colors.pink },

		-- Identifiers
		["@variable"] = { fg = colors.fg },
		["@variable.builtin"] = { fg = colors.blue, style = "italic" },
		["@constant"] = { fg = colors.blue },
		["@constant.builtin"] = { fg = colors.blue },
		["@constant.macro"] = { fg = colors.blue },
		["@namespace"] = { fg = colors.fg },
		["@symbol"] = { fg = colors.fg },

		-- Text
		["@text"] = { fg = colors.fg },
		["@text.strong"] = { fg = colors.pink, style = "bold" },
		["@text.emphasis"] = { fg = colors.pink, style = "italic" },
		["@text.underline"] = { style = "underline" },
		["@text.strike"] = { style = "strikethrough" },
		["@text.title"] = { fg = colors.blue, style = "bold" },
		["@text.literal"] = { fg = colors.blue },
		["@text.uri"] = { fg = colors.pink, style = "underline" },
		["@text.math"] = { fg = colors.blue },
		["@text.environment"] = { fg = colors.blue },
		["@text.environment.name"] = { fg = colors.blue },
		["@text.reference"] = { fg = colors.blue },

		["@text.todo"] = { link = "Todo" },
		["@text.note"] = { fg = colors.purple, style = "bold" },
		["@text.warning"] = { fg = colors.white, style = "bold" },
		["@text.danger"] = { fg = colors.red, style = "bold" },

		-- Tags
		["@tag"] = { fg = colors.green },
		["@tag.attribute"] = { fg = colors.purple },
		["@tag.delimiter"] = { fg = colors.fg },

		-- Semantic tokens
		["@class"] = { fg = colors.blue },
		["@struct"] = { fg = colors.blue },
		["@enum"] = { fg = colors.blue },
		["@enumMember"] = { fg = colors.blue },
		["@event"] = { fg = colors.blue },
		["@interface"] = { fg = colors.blue },
		["@modifier"] = { fg = colors.pink },
		["@regexp"] = { fg = colors.green },
		["@typeParameter"] = { fg = colors.white },
		["@decorator"] = { fg = colors.purple },
	}

	-- Terminal colors
	vim.g.terminal_color_0 = colors.fg_darker
	vim.g.terminal_color_1 = colors.red
	vim.g.terminal_color_2 = colors.green
	vim.g.terminal_color_3 = colors.blue
	vim.g.terminal_color_4 = colors.blue
	vim.g.terminal_color_5 = colors.pink
	vim.g.terminal_color_6 = colors.purple
	vim.g.terminal_color_7 = colors.fg
	vim.g.terminal_color_8 = colors.fg_dark
	vim.g.terminal_color_9 = colors.red
	vim.g.terminal_color_10 = colors.green_light
	vim.g.terminal_color_11 = colors.blue_light
	vim.g.terminal_color_12 = colors.blue_light
	vim.g.terminal_color_13 = colors.pink
	vim.g.terminal_color_14 = colors.purple_light
	vim.g.terminal_color_15 = colors.fg

	-- Apply editor highlights
	for group, styles in pairs(editor_syntax) do
		hi(group, styles)
	end

	-- Apply syntax highlights
	for group, styles in pairs(syntax) do
		hi(group, styles)
	end

	-- Apply Tree-sitter highlights
	for group, styles in pairs(treesitter) do
		hi(group, styles)
	end

	-- Apply plugin-specific highlights

	-- NvimTree
	hi("NvimTreeNormal", { fg = colors.fg, bg = colors.bg_alt })
	hi("NvimTreeVertSplit", { fg = colors.fg_dark, bg = colors.bg })
	hi("NvimTreeFolderName", { fg = colors.fg })
	hi("NvimTreeFolderIcon", { fg = colors.blue })
	hi("NvimTreeOpenedFolderName", { fg = colors.fg })
	hi("NvimTreeEmptyFolderName", { fg = colors.fg_dark })
	hi("NvimTreeGitDirty", { fg = colors.white })
	hi("NvimTreeGitNew", { fg = colors.green })
	hi("NvimTreeGitDeleted", { fg = colors.red })
	hi("NvimTreeSpecialFile", { fg = colors.purple })
	hi("NvimTreeIndentMarker", { fg = colors.fg_dark })
	hi("NvimTreeRootFolder", { fg = colors.pink })
	hi("NvimTreeSymlink", { fg = colors.blue })

	-- Telescope
	hi("TelescopeNormal", { fg = colors.fg, bg = colors.bg_darker })
	hi("TelescopeBorder", { fg = colors.fg_dark, bg = colors.bg_darker })
	hi("TelescopePromptBorder", { fg = colors.fg_dark, bg = colors.bg_darker })
	hi("TelescopeResultsBorder", { fg = colors.fg_dark, bg = colors.bg_darker })
	hi("TelescopePreviewBorder", { fg = colors.fg_dark, bg = colors.bg_darker })
	hi("TelescopeMatching", { fg = colors.pink })
	hi("TelescopePromptPrefix", { fg = colors.pink })
	hi("TelescopeSelection", { fg = colors.fg, bg = colors.pink .. "55" })

	-- Git signs
	hi("GitSignsAdd", { fg = colors.green })
	hi("GitSignsChange", { fg = colors.white })
	hi("GitSignsDelete", { fg = colors.red })

	-- LSP Saga
	hi("LspFloatWinNormal", { fg = colors.fg, bg = colors.bg_darker })
	hi("LspFloatWinBorder", { fg = colors.fg_dark })
	hi("LspSagaHoverBorder", { fg = colors.fg_dark })
	hi("LspSagaSignatureHelpBorder", { fg = colors.fg_dark })
	hi("LspSagaCodeActionBorder", { fg = colors.fg_dark })
	hi("LspSagaDefPreviewBorder", { fg = colors.fg_dark })
	hi("LspSagaRenameBorder", { fg = colors.fg_dark })
	hi("LspSagaBorderTitle", { fg = colors.pink })
	hi("LSPSagaDiagnosticTruncateLine", { fg = colors.fg_dark })
	hi("LspSagaDiagnosticBorder", { fg = colors.fg_dark })
	hi("LspSagaShTruncateLine", { fg = colors.fg_dark })
	hi("LspSagaDocTruncateLine", { fg = colors.fg_dark })
	hi("LspSagaLspFinderBorder", { fg = colors.fg_dark })

	-- Indent Blankline
	hi("IndentBlanklineChar", { fg = colors.fg_darker })
	hi("IndentBlanklineContextChar", { fg = colors.fg_dark })

	-- BufferLine
	hi("BufferLineIndicatorSelected", { fg = colors.pink })
	hi("BufferLineFill", { bg = colors.bg })

	-- Neogit
	hi("NeogitBranch", { fg = colors.pink })
	hi("NeogitRemote", { fg = colors.purple })
	hi("NeogitDiffAdd", { fg = colors.green })
	hi("NeogitDiffDelete", { fg = colors.red })
	hi("NeogitDiffContextHighlight", { bg = colors.fg_darker })
	hi("NeogitHunkHeader", { fg = colors.fg })
	hi("NeogitHunkHeaderHighlight", { fg = colors.fg, bg = colors.fg_darker })
end

return M
