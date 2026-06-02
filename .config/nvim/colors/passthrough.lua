-- passthrough.lua
-- Transparent colorscheme that inherits all colors from the terminal.
-- Backgrounds are NONE (see-through). Syntax uses terminal ANSI colors 0-15.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.g.colors_name = "passthrough"
vim.o.termguicolors = false -- use terminal palette, not 24-bit

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ANSI color mapping (cterm numbers):
--  0 black   1 red      2 green   3 yellow
--  4 blue    5 magenta  6 cyan    7 white
--  8 brblack 9 brred   10 brgreen 11 bryellow
-- 12 brblue 13 brmagenta 14 brcyan 15 brwhite

-- Base
hi("Normal",       { ctermbg = "NONE", ctermfg = "NONE" })
hi("NormalNC",     { ctermbg = "NONE", ctermfg = "NONE" })
hi("NormalFloat",  { ctermbg = "NONE", ctermfg = "NONE" })
hi("FloatBorder",  { ctermbg = "NONE", ctermfg = 8 })
hi("EndOfBuffer",  { ctermbg = "NONE", ctermfg = 8 })
hi("NonText",      { ctermbg = "NONE", ctermfg = 8 })
hi("SpecialKey",   { ctermbg = "NONE", ctermfg = 8 })
hi("Whitespace",   { ctermbg = "NONE", ctermfg = 8 })

-- Syntax
hi("Comment",      { ctermbg = "NONE", ctermfg = 8,  cterm = { italic = true } })
hi("Constant",     { ctermbg = "NONE", ctermfg = 6  })  -- cyan
hi("String",       { ctermbg = "NONE", ctermfg = 2  })  -- green
hi("Character",    { ctermbg = "NONE", ctermfg = 2  })
hi("Number",       { ctermbg = "NONE", ctermfg = 6  })
hi("Boolean",      { ctermbg = "NONE", ctermfg = 5  })  -- magenta
hi("Float",        { ctermbg = "NONE", ctermfg = 6  })
hi("Identifier",   { ctermbg = "NONE", ctermfg = "NONE" })
hi("Function",     { ctermbg = "NONE", ctermfg = 4  })  -- blue
hi("Statement",    { ctermbg = "NONE", ctermfg = 5  })  -- magenta
hi("Keyword",      { ctermbg = "NONE", ctermfg = 5  })
hi("Conditional",  { ctermbg = "NONE", ctermfg = 5  })
hi("Repeat",       { ctermbg = "NONE", ctermfg = 5  })
hi("Label",        { ctermbg = "NONE", ctermfg = 5  })
hi("Operator",     { ctermbg = "NONE", ctermfg = "NONE" })
hi("Exception",    { ctermbg = "NONE", ctermfg = 1  })  -- red
hi("PreProc",      { ctermbg = "NONE", ctermfg = 3  })  -- yellow
hi("Include",      { ctermbg = "NONE", ctermfg = 3  })
hi("Define",       { ctermbg = "NONE", ctermfg = 3  })
hi("Macro",        { ctermbg = "NONE", ctermfg = 3  })
hi("PreCondit",    { ctermbg = "NONE", ctermfg = 3  })
hi("Type",         { ctermbg = "NONE", ctermfg = 11 })  -- bright yellow
hi("StorageClass", { ctermbg = "NONE", ctermfg = 11 })
hi("Structure",    { ctermbg = "NONE", ctermfg = 11 })
hi("Typedef",      { ctermbg = "NONE", ctermfg = 11 })
hi("Special",      { ctermbg = "NONE", ctermfg = 14 })  -- bright cyan
hi("SpecialChar",  { ctermbg = "NONE", ctermfg = 14 })
hi("Tag",          { ctermbg = "NONE", ctermfg = 14 })
hi("Delimiter",    { ctermbg = "NONE", ctermfg = "NONE" })
hi("SpecialComment",{ ctermbg = "NONE", ctermfg = 8 })
hi("Underlined",   { ctermbg = "NONE", ctermfg = 4,  cterm = { underline = true } })
hi("Bold",         { ctermbg = "NONE", ctermfg = "NONE", cterm = { bold = true } })
hi("Italic",       { ctermbg = "NONE", ctermfg = "NONE", cterm = { italic = true } })
hi("Error",        { ctermbg = "NONE", ctermfg = 9  })  -- bright red
hi("Warning",      { ctermbg = "NONE", ctermfg = 11 })
hi("Todo",         { ctermbg = "NONE", ctermfg = 3,  cterm = { bold = true } })

-- UI chrome
hi("LineNr",        { ctermbg = "NONE", ctermfg = 8  })
hi("CursorLineNr",  { ctermbg = "NONE", ctermfg = 3,  cterm = { bold = true } })
hi("CursorLine",    { ctermbg = 0,      ctermfg = "NONE" })
hi("CursorColumn",  { ctermbg = 0,      ctermfg = "NONE" })
hi("ColorColumn",   { ctermbg = 0,      ctermfg = "NONE" })
hi("SignColumn",    { ctermbg = "NONE", ctermfg = 8  })
hi("FoldColumn",    { ctermbg = "NONE", ctermfg = 8  })
hi("Folded",        { ctermbg = "NONE", ctermfg = 8  })
hi("VertSplit",     { ctermbg = "NONE", ctermfg = 8  })
hi("WinSeparator",  { ctermbg = "NONE", ctermfg = 8  })

-- Status/tab line
hi("StatusLine",    { ctermbg = 0,      ctermfg = 7  })
hi("StatusLineNC",  { ctermbg = "NONE", ctermfg = 8  })
hi("TabLine",       { ctermbg = "NONE", ctermfg = 8  })
hi("TabLineSel",    { ctermbg = "NONE", ctermfg = 7,  cterm = { bold = true } })
hi("TabLineFill",   { ctermbg = "NONE", ctermfg = 8  })
hi("WildMenu",      { ctermbg = 4,      ctermfg = 0  })

-- Search / selection
hi("Visual",        { ctermbg = 8,      ctermfg = "NONE" })
hi("VisualNOS",     { ctermbg = 8,      ctermfg = "NONE" })
hi("Search",        { ctermbg = 3,      ctermfg = 0  })
hi("IncSearch",     { ctermbg = 11,     ctermfg = 0  })
hi("CurSearch",     { ctermbg = 11,     ctermfg = 0  })
hi("Substitute",    { ctermbg = 1,      ctermfg = 0  })

-- Completion menu
hi("Pmenu",         { ctermbg = 0,      ctermfg = "NONE" })
hi("PmenuSel",      { ctermbg = 4,      ctermfg = 0  })
hi("PmenuSbar",     { ctermbg = 0,      ctermfg = "NONE" })
hi("PmenuThumb",    { ctermbg = 8,      ctermfg = "NONE" })

-- Diagnostics
hi("DiagnosticError",       { ctermbg = "NONE", ctermfg = 1  })
hi("DiagnosticWarn",        { ctermbg = "NONE", ctermfg = 3  })
hi("DiagnosticInfo",        { ctermbg = "NONE", ctermfg = 4  })
hi("DiagnosticHint",        { ctermbg = "NONE", ctermfg = 8  })
hi("DiagnosticOk",          { ctermbg = "NONE", ctermfg = 2  })
hi("DiagnosticUnderlineError", { cterm = { undercurl = true }, ctermfg = 1 })
hi("DiagnosticUnderlineWarn",  { cterm = { undercurl = true }, ctermfg = 3 })
hi("DiagnosticUnderlineInfo",  { cterm = { undercurl = true }, ctermfg = 4 })
hi("DiagnosticUnderlineHint",  { cterm = { undercurl = true }, ctermfg = 8 })

-- Diff
hi("DiffAdd",       { ctermbg = "NONE", ctermfg = 2,  cterm = { bold = true } })
hi("DiffChange",    { ctermbg = "NONE", ctermfg = 3  })
hi("DiffDelete",    { ctermbg = "NONE", ctermfg = 1  })
hi("DiffText",      { ctermbg = "NONE", ctermfg = 11, cterm = { bold = true } })
hi("Added",         { ctermbg = "NONE", ctermfg = 2  })
hi("Changed",       { ctermbg = "NONE", ctermfg = 3  })
hi("Removed",       { ctermbg = "NONE", ctermfg = 1  })

-- Spelling
hi("SpellBad",      { cterm = { undercurl = true }, ctermfg = 1 })
hi("SpellCap",      { cterm = { undercurl = true }, ctermfg = 3 })
hi("SpellLocal",    { cterm = { undercurl = true }, ctermfg = 6 })
hi("SpellRare",     { cterm = { undercurl = true }, ctermfg = 5 })

-- Misc
hi("MatchParen",    { ctermbg = 8,      ctermfg = "NONE", cterm = { bold = true } })
hi("Conceal",       { ctermbg = "NONE", ctermfg = 8  })
hi("Directory",     { ctermbg = "NONE", ctermfg = 4  })
hi("Title",         { ctermbg = "NONE", ctermfg = 4,  cterm = { bold = true } })
hi("Question",      { ctermbg = "NONE", ctermfg = 2  })
hi("MoreMsg",       { ctermbg = "NONE", ctermfg = 2  })
hi("ModeMsg",       { ctermbg = "NONE", ctermfg = "NONE", cterm = { bold = true } })
hi("ErrorMsg",      { ctermbg = "NONE", ctermfg = 1  })
hi("WarningMsg",    { ctermbg = "NONE", ctermfg = 3  })
hi("Cursor",        { ctermbg = 7,      ctermfg = 0  })
hi("lCursor",       { ctermbg = 7,      ctermfg = 0  })

-- Treesitter overrides (keep consistent with legacy syntax groups above)
hi("@comment",              { link = "Comment" })
hi("@string",               { link = "String" })
hi("@string.escape",        { link = "SpecialChar" })
hi("@number",               { link = "Number" })
hi("@float",                { link = "Float" })
hi("@boolean",              { link = "Boolean" })
hi("@keyword",              { link = "Keyword" })
hi("@keyword.return",       { link = "Keyword" })
hi("@keyword.function",     { link = "Keyword" })
hi("@keyword.operator",     { link = "Keyword" })
hi("@conditional",          { link = "Conditional" })
hi("@repeat",               { link = "Repeat" })
hi("@function",             { link = "Function" })
hi("@function.call",        { link = "Function" })
hi("@function.method",      { link = "Function" })
hi("@function.method.call", { link = "Function" })
hi("@constructor",          { link = "Function" })
hi("@type",                 { link = "Type" })
hi("@type.builtin",         { link = "Type" })
hi("@variable",             { ctermbg = "NONE", ctermfg = "NONE" })
hi("@variable.builtin",     { ctermbg = "NONE", ctermfg = 9 })
hi("@variable.parameter",   { ctermbg = "NONE", ctermfg = "NONE" })
hi("@constant",             { link = "Constant" })
hi("@constant.builtin",     { link = "Boolean" })
hi("@operator",             { link = "Operator" })
hi("@punctuation",          { ctermbg = "NONE", ctermfg = "NONE" })
hi("@punctuation.bracket",  { ctermbg = "NONE", ctermfg = "NONE" })
hi("@punctuation.delimiter",{ ctermbg = "NONE", ctermfg = "NONE" })
hi("@namespace",            { link = "Type" })
hi("@module",               { link = "Type" })
hi("@tag",                  { link = "Keyword" })
hi("@tag.attribute",        { link = "Identifier" })
hi("@tag.delimiter",        { ctermbg = "NONE", ctermfg = 8 })
hi("@markup.heading",       { link = "Title" })
hi("@markup.link",          { link = "Underlined" })
hi("@markup.raw",           { link = "String" })
hi("@markup.italic",        { link = "Italic" })
hi("@markup.strong",        { link = "Bold" })
