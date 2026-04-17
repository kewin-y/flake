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
          }
        end,
      },
    },
  },
}
