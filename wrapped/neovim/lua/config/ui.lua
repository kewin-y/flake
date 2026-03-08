local colors = _G.theme

require("mini.base16").setup({
    palette = colors,
})

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
    highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
    },
})

local function hi(group, args)
    local cmd = string.format(
        "highlight %s guifg=%s guibg=%s gui=%s",
        group,
        args.fg or "NONE",
        args.bg or "NONE",
        args.gui or "NONE"
    )
    vim.cmd(cmd)
end

local function hi_link(group, link)
    local cmd = string.format("highlight! link %s %s", group, link)
    vim.cmd(cmd)
end

hi("WinSeparator", { fg = colors.base02 })
hi("NormalFloat", { fg = colors.base5, bg = colors.base00 })
hi("FloatBorder", { fg = colors.base05, bg = colors.base00 })
hi("LineNr", { fg = colors.base03 })
hi("LineNrAbove", { fg = colors.base03 })
hi("LineNrBelow", { fg = colors.base03 })
hi("SignColumn", { fg = colors.base03 })
hi("StatusLine", { fg = colors.base04, bg = colors.base01 })

hi("DiagnosticFloatingError", { fg = colors.base08, bg = colors.base00 })
hi("DiagnosticFloatingHint", { fg = colors.base0A, bg = colors.base00 })
hi("DiagnosticFloatingInfo", { fg = colors.base0C, bg = colors.base00 })
hi("DiagnosticFloatingOk", { fg = colors.base0B, bg = colors.base00 })
hi("DiagnosticFloatingWarn", { fg = colors.base0E, bg = colors.base00 })
hi("DiagnosticSignError", { fg = colors.base08, bg = colors.base00 })
hi("DiagnosticSignHint", { fg = colors.base0A, bg = colors.base00 })
hi("DiagnosticSignInfo", { fg = colors.base0C, bg = colors.base00 })
hi("DiagnosticSignOk", { fg = colors.base0B, bg = colors.base00 })
hi("DiagnosticSignWarn", { fg = colors.base0E, bg = colors.base00 })

hi("BlinkCmpMenu", { fg = colors.base05, bg = colors.base00 })
hi("BlinkCmpMenuBorder", { fg = colors.base05, bg = colors.base00 })
hi("BlinkCmpMenuSelection", { fg = colors.base05, bg = colors.base01 })
hi("BlinkCmpKind", { bg = colors.base00 })

hi_link("BlinkCmpKindClass", "Type")
hi_link("BlinkCmpKindColor", "Special")
hi_link("BlinkCmpKindConstant", "Constant")
hi_link("BlinkCmpKindConstructor", "Type")
hi_link("BlinkCmpKindEnum", "Structure")
hi_link("BlinkCmpKindEnumMember", "Structure")
hi_link("BlinkCmpKindEvent", "Exception")
hi_link("BlinkCmpKindField", "Structure")
hi_link("BlinkCmpKindFile", "Tag")
hi_link("BlinkCmpKindFolder", "Directory")
hi_link("BlinkCmpKindFunction", "Function")
hi_link("BlinkCmpKindInterface", "Structure")
hi_link("BlinkCmpKindKeyword", "Keyword")
hi_link("BlinkCmpKindMethod", "Function")
hi_link("BlinkCmpKindModule", "Structure")
hi_link("BlinkCmpKindOperator", "Operator")
hi_link("BlinkCmpKindProperty", "Structure")
hi_link("BlinkCmpKindReference", "Tag")
hi_link("BlinkCmpKindSnippet", "Special")
hi_link("BlinkCmpKindStruct", "Structure")
hi_link("BlinkCmpKindText", "Statement")
hi_link("BlinkCmpKindTypeParameter", "Type")
hi_link("BlinkCmpKindUnit", "Special")
hi_link("BlinkCmpKindValue", "Identifier")
hi_link("BlinkCmpKindVariable", "Delimiter")
