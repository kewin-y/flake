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
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = { "saghen/blink.cmp" },
  },
}
