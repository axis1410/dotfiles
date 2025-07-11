-- Colorscheme generated by https://github.com/arcticlimer/djanho
-- Theme: Cursor Default

vim.cmd[[highlight clear]]

if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "cursor-default"

local highlight = function(group, bg, fg, attr)
    fg = fg and 'guifg=' .. fg or ''
    bg = bg and 'guibg=' .. bg or ''
    attr = attr and 'gui=' .. attr or ''

    vim.api.nvim_command('highlight ' .. group .. ' '.. fg .. ' ' .. bg .. ' '.. attr)
end

local link = function(target, group)
    vim.api.nvim_command('highlight! link ' .. target .. ' '.. group)
end

local Color1 = '#83D6C5'
local Color2 = '#EFB080'
local Color6 = '#141414'
local Color8 = '#1a1a1a'
local Color11 = '#302324'
local Color10 = '#2c2f29'
local Color5 = '#EBC88D'
local Color0 = '#D6D6DD'
local Color3 = '#82D2CE'
local Color4 = '#E394DC'
local Color9 = '#d8dee9'
local Color12 = '#303030'
local Color13 = '#505050'
local Color14 = '#ffffff'
local Color7 = '#747474'

highlight('Operator', nil, Color0, nil)
highlight('Keyword', nil, Color1, nil)
highlight('Identifier', nil, Color0, nil)
highlight('Function', nil, Color2, nil)
highlight('Type', nil, Color2, nil)
highlight('Type', nil, Color3, nil)
highlight('String', nil, Color4, nil)
highlight('Number', nil, Color5, nil)
highlight('StatusLine', Color7, Color6, nil)
highlight('WildMenu', Color8, Color9, nil)
highlight('Pmenu', Color8, Color9, nil)
highlight('PmenuSel', Color9, Color8, nil)
highlight('PmenuThumb', Color8, Color9, nil)
highlight('DiffAdd', Color10, nil, nil)
highlight('DiffDelete', Color11, nil, nil)
highlight('Normal', Color8, Color9, nil)
highlight('Visual', Color12, nil, nil)
highlight('CursorLine', Color12, nil, nil)
highlight('ColorColumn', Color12, nil, nil)
highlight('SignColumn', Color8, nil, nil)
highlight('LineNr', nil, Color13, nil)
highlight('TabLine', Color6, Color13, nil)
highlight('TabLineSel', Color14, Color8, nil)
highlight('TabLineFill', Color6, Color13, nil)
highlight('TSPunctDelimiter', nil, Color9, nil)

link('TSFunction', 'Function')
link('TSPunctBracket', 'MyTag')
link('TSProperty', 'TSField')
link('TSNumber', 'Number')
link('TSConstBuiltin', 'TSVariableBuiltin')
link('TSLabel', 'Type')
link('TSTag', 'MyTag')
link('Repeat', 'Conditional')
link('TSFloat', 'Number')
link('TSTagDelimiter', 'Type')
link('TSKeyword', 'Keyword')
link('TSString', 'String')
link('Conditional', 'Operator')
link('NonText', 'Comment')
link('TSParameterReference', 'TSParameter')
link('TSOperator', 'Operator')
link('Macro', 'Function')
link('TelescopeNormal', 'Normal')
link('TSConstant', 'Constant')
link('Whitespace', 'Comment')
link('TSComment', 'Comment')
link('TSPunctSpecial', 'TSPunctDelimiter')
link('TSField', 'Constant')
link('TSConditional', 'Conditional')
link('TSType', 'Type')
link('TSNamespace', 'TSType')
link('Operator', 'Keyword')
link('Folded', 'Comment')
link('TSRepeat', 'Repeat')
link('TSParameter', 'Constant')
link('CursorLineNr', 'Identifier')
link('TSFuncMacro', 'Macro') 