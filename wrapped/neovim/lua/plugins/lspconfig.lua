return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        lazy = true,
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspStart" },
        config = function()
            vim.diagnostic.config({
                virtual_lines = {
                    current_line = true,
                },
            })

            local servers = {
                "lua_ls",
                "clangd",
                "nixd",
                "astro",
                "tinymist",
                "ts_ls",
                "rust_analyzer",
                "basedpyright",
                "tailwindcss",
                "hls",
            }

            for _, server in pairs(servers) do
                vim.lsp.enable(server)
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                -- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/init.lua
                group = vim.api.nvim_create_augroup("KevinLsp", {}),
                callback = function(_)
                    local lsp = vim.lsp.buf
                    vim.keymap.set("n", "grd", lsp.definition, { desc = "Goto Definition" })
                    vim.keymap.set("n", "gre", lsp.declaration, { desc = "Goto Declaration" })
                    vim.keymap.set("n", "gws", lsp.workspace_symbol, { desc = "Workspace Symbol" })
                end,
            })
        end,
    },
}
