return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,

        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            indent = {
                enabled = true,
                animate = {
                    enabled = false,
                },
            },
            scope = { enabled = true },
        },
    },
}
