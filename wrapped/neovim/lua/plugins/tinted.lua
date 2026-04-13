return {
  {
    "tinted-theming/tinted-nvim",
    priority = 1000,
    lazy = false,
    opts = {
      default_scheme = "base16-flexoki-dark",
      highlights = {
        overrides = function(palette)
          local base03_darker = { darken = palette.base03, amount = 0.4 }
          return {
            LineNr = { fg = "foreground" },
            LineNrAbove = { fg = base03_darker },
            LineNrBelow = { fg = base03_darker },
            NonText = { fg = base03_darker },
            EndOfBuffer = { fg = base03_darker },
            SignColumn = { fg = base03_darker },
            WinSeparator = { fg = "darkest_grey" },
            PmenuSel = { bg = "darkest_grey" },
            MiniPickMatchCurrent = { bg = "darkest_grey" },
            MiniPickMatchMarked = { bg = "dark_grey" },
            StatusLine = { fg = palette.base04, bg = palette.base01 },

            -- https://github.com/nvim-mini/mini.base16/blob/main/lua/mini/base16.lua
            -- I moved away from mini.base16 as tinted-nvim provides better syntax highlighting
            -- I still prefer mini.base16's markdown highlighting, so here it is
            RenderMarkdownBullet = { fg = palette.base0E, bg = nil },
            RenderMarkdownChecked = { link = "DiagnosticOk" },
            RenderMarkdownCode = { fg = nil, bg = palette.base01 },
            RenderMarkdownCodeInline = { link = "Normal" },
            RenderMarkdownDash = { fg = palette.base0E, bg = nil },
            RenderMarkdownH1 = { fg = palette.base09, bg = nil },
            RenderMarkdownH1Bg = { fg = palette.base09, bg = palette.base01 },
            RenderMarkdownH2 = { fg = palette.base0A, bg = nil },
            RenderMarkdownH2Bg = { fg = palette.base0A, bg = palette.base01 },
            RenderMarkdownH3 = { fg = palette.base0B, bg = nil },
            RenderMarkdownH3Bg = { fg = palette.base0B, bg = palette.base01 },
            RenderMarkdownH4 = { fg = palette.base0C, bg = nil },
            RenderMarkdownH4Bg = { fg = palette.base0C, bg = palette.base01 },
            RenderMarkdownH5 = { fg = palette.base0D, bg = nil },
            RenderMarkdownH5Bg = { fg = palette.base0D, bg = palette.base01 },
            RenderMarkdownH6 = { fg = palette.base0F, bg = nil },
            RenderMarkdownH6Bg = { fg = palette.base0F, bg = palette.base01 },
            RenderMarkdownTodo = { link = "Todo" },
            RenderMarkdownUnchecked = { link = "DiagnosticWarn" },
            markdownH1 = { fg = palette.base09, bg = nil },
            markdownH2 = { fg = palette.base0A, bg = nil },
            markdownH3 = { fg = palette.base0B, bg = nil },
            markdownH4 = { fg = palette.base0C, bg = nil },
            markdownH5 = { fg = palette.base0D, bg = nil },
            markdownH6 = { fg = palette.base0F, bg = nil },
            ["@markup.heading.1"] = { link = "markdownH1" },
            ["@markup.heading.2"] = { link = "markdownH2" },
            ["@markup.heading.3"] = { link = "markdownH3" },
            ["@markup.heading.4"] = { link = "markdownH4" },
            ["@markup.heading.5"] = { link = "markdownH5" },
            ["@markup.heading.6"] = { link = "markdownH6" },
          }
        end,
      },
    },
  },
}
