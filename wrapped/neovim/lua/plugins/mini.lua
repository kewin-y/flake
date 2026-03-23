return {
  {
    "nvim-mini/mini.hipatterns",
    lazy = false,
    version = false,
    opts = function()
      local hi = require("mini.hipatterns")
      return {
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hi.gen_highlighter.hex_color(),
        },
      }
    end,
  },
  {
    "echasnovski/mini.pick",
    lazy = false,
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
        mark_all = "<C-q>",
        choose_marked = "<C-CR>",
      },
    },
  },
}
