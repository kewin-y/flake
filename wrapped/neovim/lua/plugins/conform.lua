return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>fm",
            function()
                require("conform").format({
                    async = true,
                    filter = function(client)
                        return client.name ~= "ts_ls"
                    end,
                })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua" },
            markdown = { "prettierd" },
            astro = { "prettierd" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            nix = { "alejandra" },
            typst = { "typstyle" },
            typescript = { "prettierd" },
            javascript = { "prettierd" },
            typescriptreact = { "prettierd" },
            javascriptreact = { "prettierd" },
            rust = { "rustfmt" },
            python = { "ruff" },
            haskell = { "ormolu" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        formatters = {},
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
