vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.fillchars = { eob = " " }
vim.opt.termguicolors = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.showmode = true
vim.opt.numberwidth = 2
vim.opt.smartcase = true
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.ruler = false
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.conceallevel = 1
vim.opt.winborder = "rounded"
vim.opt.pumborder = "rounded"
vim.opt.whichwrap:append("<>[]hl")
vim.opt.relativenumber = true
vim.opt.autoread = true

vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.icons" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/tinted-theming/tinted-nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/saghen/blink.cmp",                version = vim.version.range("^1") },
  { src = "https://github.com/ibhagwan/fzf-lua" },
})

require("mini.icons").setup()
require("oil").setup()

local servers = {
  "lua_ls",
  "clangd",
  "nixd",
  "astro",
  "tinymist",
  -- "ts_ls",
  "tsgo",
  "rust_analyzer",
  "basedpyright",
  "tailwindcss",
  "hls",
}

for _, server in pairs(servers) do
  vim.lsp.enable(server)
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("KevinLsp", {}),

  callback = function(_)
    local lsp = vim.lsp.buf

    vim.keymap.set("n", "grd", lsp.definition, { desc = "Goto Definition" })
    vim.keymap.set("n", "gre", lsp.declaration, { desc = "Goto Declaration" })
    vim.keymap.set("n", "gws", lsp.workspace_symbol, { desc = "Workspace Symbol" })
    vim.keymap.set("n", "<leader>fm", lsp.format, { desc = "Workspace Symbol" })
  end,
})

require("tinted-nvim").setup({
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
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    -- Enable treesitter highlighting and disable regex syntax
    pcall(vim.treesitter.start, args.buf)
    -- Enable treesitter-based indentation
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt.foldenable = false
  end,
})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },
    ["<C-y>"] = { "accept", "fallback" },

    ["<Tab>"] = { "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },

    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
    ["<C-n>"] = { "select_next", "fallback_to_mappings" },

    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },

    ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
  },

  appearance = {
    nerd_font_variant = "normal",
  },

  completion = {
    documentation = {
      auto_show = false,
      window = {
        scrollbar = false,
      },
    },
    menu = {
      scrollbar = false,
      auto_show = true,
      draw = {
        treesitter = { "lsp" },
        padding = { 0, 1 },
        columns = {
          { "kind_icon", "kind" },
          { "label",     "label_description", gap = 1 },
        },
      },
    },
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "lua" },
})

require("fzf-lua").setup({
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept",
    },
  },
  defaults = {
    file_icons = "mini",
  },
  winopts = {
    border = "single",
    preview = {
      border = "single",
      scrollbar = false,
    },
  },
  hls = {
    backdrop = "FloatBorder",
  },
})


local m = vim.keymap.set

m("n", "<leader>ff", "<cmd>FzfLua files<CR>", { silent = true })
m("n", "<leader>fw", "<cmd>FzfLua live_grep<CR>", { silent = true })
m("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { silent = true })
m("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { silent = true })
m("n", "<leader>bi", "<cmd>FzfLua<CR>", { silent = true })
m("n", "<leader>sr", "<cmd>FzfLua lsp_references<CR>", { silent = true })

-- MOVE
m("i", "<C-h>", "<Left>", { desc = "move left" })
m("i", "<C-l>", "<Right>", { desc = "move right" })
m("i", "<C-j>", "<Down>", { desc = "move down" })
m("i", "<C-k>", "<Up>", { desc = "move up" })

-- Turn off highlighting
m("n", "<Esc>", "<cmd>noh<CR>", { silent = true })

-- Move up & down within wrapped line
m({ "n", "v" }, "k", [[v:count || mode(1)[0:1] == "no" ? "k" : "gk"]], { expr = true })
m({ "n", "v" }, "j", [[v:count || mode(1)[0:1] == "no" ? "j" : "gj"]], { expr = true })

-- Clipboard
m({ "n", "v" }, "<leader>y", [["+y]])
m("n", "<leader>Y", [["+Y]])

-- Greatest keymaps ever
m("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
m("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- QOL
m("n", "J", "mzJ`z")
m("v", "<", "<gv")
m("v", ">", ">gv")

-- Tabs
m("n", "<leader>tt", "<Cmd>tabnew<CR>")
m("n", "<leader>tw", "<Cmd>tabclose<CR>")
m("n", "<A-l>", "<Cmd>tabnext<CR>")
m("n", "<A-h>", "<Cmd>tabprevious<CR>")

--- Oil
m("n", "<leader>w", "<CMD>Oil --float<CR>")

local format_group = vim.api.nvim_create_augroup("Format", {})
local spell_group = vim.api.nvim_create_augroup("Spell", {})
local ft_group = vim.api.nvim_create_augroup("Filetype", {})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*" },
  group = ft_group,
  callback = function(_)
    vim.cmd("filetype detect")
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  group = format_group,
  callback = function(_)
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.typ", "*.md" },
  group = spell_group,
  callback = function(_)
    vim.cmd("setlocal spell spelllang=en_ca")
  end,
})
