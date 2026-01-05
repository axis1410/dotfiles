local set = vim.api.nvim_set_hl

set(0, "BlinkCmpMenuSelection", { link = "PmenuSel" })
set(0, "BlinkCmpDocCursorLine", { link = "CursorLine" })

set(0, "BlinkCmpLabelMatch", { bold = true })
set(0, "BlinkCmpLabelDeprecated", { strikethrough = true })
set(0, "BlinkCmpGhostText", { link = "Comment" })

set(0, "BlinkCmpKind", { link = "PmenuKind" })

set(0, "BlinkCmpKindFunction", { link = "@function" })
set(0, "BlinkCmpKindMethod", { link = "@function.method" })
set(0, "BlinkCmpKindConstructor", { link = "@constructor" })

set(0, "BlinkCmpKindClass", { link = "@type" })
set(0, "BlinkCmpKindInterface", { link = "@type" })
set(0, "BlinkCmpKindStruct", { link = "@type" })
set(0, "BlinkCmpKindTypeParameter", { link = "@type" })

set(0, "BlinkCmpKindVariable", { link = "@variable" })
set(0, "BlinkCmpKindField", { link = "@property" })
set(0, "BlinkCmpKindProperty", { link = "@property" })

set(0, "BlinkCmpKindConstant", { link = "@constant" })
set(0, "BlinkCmpKindKeyword", { link = "@keyword" })
set(0, "BlinkCmpKindOperator", { link = "@operator" })
set(0, "BlinkCmpKindModule", { link = "@module" })

set(0, "BlinkCmpKindSnippet", { link = "Special" })
set(0, "BlinkCmpKindFile", { link = "Directory" })
set(0, "BlinkCmpKindFolder", { link = "Directory" })
