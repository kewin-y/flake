return {
    {
        "nvim-mini/mini.base16",
        event = "VeryLazy",
        lazy = true,
        version = false,
    },
    {
        "nvim-mini/mini.hipatterns",
        event = "VeryLazy",
        lazy = true,
        version = false,
    },
    {
        "echasnovski/mini.pick",
        lazy = true,
        cmd = { "Pick" },
        dependencies = {
            { "nvim-mini/mini.icons", version = false, opts = {} },
            { "echasnovski/mini.extra", version = false },
        },
        keys = {
            { "<leader>ff", "<cmd>Pick files<CR>", desc = "Find files" },
            { "<leader>fw", "<cmd>Pick grep_live<CR>", desc = "Live grep" },
            { "<leader>fb", "<cmd>Pick buffers<CR>", desc = "Buffers" },
            { "<leader>fo", "<cmd>Pick oldfiles<CR>", desc = "Oldfiles" },
            { "<leader>bi", "<cmd>Pick pickers<CR>", desc = "Built-in pickers" },
            { "<leader>sr", "<cmd>Pick lsp scope='references'<CR>", desc = "LSP references" },
        },
        config = function(_, opts)
            require("mini.pick").setup(opts)
            require("mini.extra").setup()
        end,
        opts = {
            window = {
                config = {
                    border = "single",
                },
            },
            mappings = {
                -- See the breakdown below regarding Ctrl-Q
                mark_all = "<C-q>",
                choose_marked = "<C-CR>"

            },
        },
    },
}
