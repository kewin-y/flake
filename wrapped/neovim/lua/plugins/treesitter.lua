return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = true,
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "markdown",
                    "markdown_inline",
                    "nix",
                    "astro",
                    "rust",
                    "typst",
                    "typescript",
                    "javascript",
                    "latex",
                    "python",
                    "yaml",
                    "tsx",
                    "haskell",
                },
                sync_install = false,
                auto_install = false,
                ignore_install = { "r" },
                highlight = {
                    enable = true,
                },
                modules = {},
            })
        end,
    },
}
