return {
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = "1.*",
        config = function()
            -- Hack for Nix
            local function get_exec(name)
                if vim.fn.executable(name) == 1 then
                    local p = vim.fn.exepath(name)
                    if p ~= "" then
                        return p
                    end
                end
                return nil
            end

            local tinymist_exec = get_exec("tinymist")
            local websocat_exec = get_exec("websocat")

            require("typst-preview").setup({
                dependencies_bin = {
                    ["tinymist"] = tinymist_exec,
                    ["websocat"] = websocat_exec,
                },
            })
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use standalone mini plugins
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
}
