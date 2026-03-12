return {
    {
        "tinted-theming/tinted-nvim",
        priority = 1000,
        lazy = false,
        opts = {
            default_scheme = "base16-flexoki-dark",
            highlights = {
                overrides = function(_)
                    return {
                        LineNr = { fg = "grey" },
                        LineNrAbove = { fg = "grey" },
                        LineNrBelow = { fg = "grey" },
                        NonText = { fg = "grey" },
                        EndOfBuffer = { fg = "grey" },
                        SignColumn = { fg = "grey" },
                        WinSeparator = { fg = "grey" },
                        PmenuSel = { bg = "darkest_grey" },
                        MiniPickMatchCurrent = { bg = "darkest_grey" },
                        MiniPickMatchMarked = { bg = "dark_grey" },
                    }
                end,
            },
        },
    },
}
