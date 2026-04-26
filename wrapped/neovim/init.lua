---@diagnostic disable: missing-fields, undefined-field

local config_dir = _G.config_dir or vim.fn.stdpath("config")

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

vim.o.pumheight = 7
vim.o.smartcase = true
vim.o.ignorecase = true

vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.icons" },
  { src = "https://github.com/nvim-mini/mini.hipatterns" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/folke/lazydev.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/tinted-theming/tinted-nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/zk-org/zk-nvim" },
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("^2") },
  { src = "https://github.com/chomosuke/typst-preview.nvim" },
})

-- mini
local hi = require("mini.hipatterns")

hi.setup({
  highlighters = {
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
    hex_color = hi.gen_highlighter.hex_color(),
  },
})

require("mini.icons").setup()

-- oil
require("oil").setup()
vim.keymap.set("n", "<leader>w", "<CMD>Oil<CR>")

-- lsp
local servers = {
  "lua_ls",
  "clangd",
  "nixd",
  "astro",
  "tinymist",
  "tsgo",
  "rust_analyzer",
  "ty",
  "tailwindcss",
  "hls",
}

for _, server in pairs(servers) do
  vim.lsp.enable(server)
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("Lsp", {}),

  callback = function(_)
    local lsp = vim.lsp.buf

    vim.keymap.set("n", "grd", lsp.definition, { desc = "Goto Definition" })
    vim.keymap.set("n", "gre", lsp.declaration, { desc = "Goto Declaration" })
    vim.keymap.set("n", "gws", lsp.workspace_symbol, { desc = "Workspace Symbol" })
  end,
})

require("lazydev").setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})

-- conform
local conform = require("conform")

conform.setup({
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
    python = { "ruff_format" },
    haskell = { "ormolu" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  formatters = {},
})

local function format()
  conform.format({ async = true })
end

vim.keymap.set("n", "<leader>fm", format, { desc = "Format buffer using conform" })

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

-- treesitter
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt.foldenable = false
  end,
})

-- fzf
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

vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fw", "<cmd>FzfLua live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { silent = true })
vim.keymap.set("n", "<leader>bi", "<cmd>FzfLua<CR>", { silent = true })
vim.keymap.set("n", "<leader>sr", "<cmd>FzfLua lsp_references<CR>", { silent = true })

-- zk
require("zk").setup({
  picker = "fzf_lua",
  lsp = {
    config = {
      name = "zk",
      cmd = { "zk", "lsp" },
      filetypes = { "markdown" },
    },
    auto_attach = {
      enabled = true,
    },
  },
})

local function find_obsidian_root(start)
  local dir = vim.fs.dirname(start)

  while dir do
    if vim.fn.isdirectory(dir .. "/.obsidian") == 1 then
      return dir
    end

    local parent = vim.fs.dirname(dir)
    if parent == dir then
      break
    end
    dir = parent
  end
end

-- Helper: Open current file in Obsidian
local function open_in_obsidian()
  local file = vim.fn.expand("%:p")
  local root = find_obsidian_root(file)

  if not root then
    vim.notify("Not inside an Obsidian vault", vim.log.levels.WARN)
    return
  end

  local vault = vim.fn.fnamemodify(root, ":t")
  local rel = file:sub(#root + 2):gsub(" ", "%%20")
  local url = string.format("obsidian://open?vault=%s&file=%s", vault, rel)

  vim.cmd("silent write")
  vim.fn.jobstart({ "xdg-open", url }, { detach = true })
end

local zk_group = vim.api.nvim_create_augroup("ZK", {})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = zk_group,
  callback = function()
    if vim.fn.isdirectory(vim.fn.getcwd() .. "/.zk") ~= 1 then
      return
    end

    local zk = require("zk")

    vim.keymap.set("n", "<leader>on", function()
      zk.new({ title = vim.fn.input("Title: ") })
    end, { desc = "New ZK note" })

    vim.keymap.set(
      "n",
      "<leader>oo",
      "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",
      { desc = "Open ZK notes" }
    )

    vim.keymap.set("n", "<leader>of", function()
      zk.notes({ match = { vim.fn.input("Search: ") } })
    end, { desc = "Search ZK notes" })

    vim.keymap.set("n", "<leader>ot", "<Cmd>ZkTags<CR>", { desc = "ZK tags" })
    vim.keymap.set("v", "<leader>of", ":'<,'>ZkMatch<CR>", { desc = "Match selection" })
    vim.keymap.set("n", "<leader>ob", "<Cmd>ZkBacklinks<CR>", { desc = "ZK backlinks" })
    vim.keymap.set("n", "<leader>op", open_in_obsidian, { desc = "Open in Obsidian" })
  end,
})

require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_vscode").load()
require("luasnip.loaders.from_lua").load({ paths = config_dir .. "/snippets/" })
require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },
    ["<C-l>"] = { "accept", "fallback" },

    ["<C-j>"] = { "snippet_forward", "fallback" },
    ["<C-k>"] = { "snippet_backward", "fallback" },

    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
    ["<C-n>"] = { "select_next", "fallback_to_mappings" },

    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },

    ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
  },

  appearance = {
    nerd_font_variant = "normal",
  },

  snippets = {
    preset = "luasnip",
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
          { "label", "label_description", gap = 1 },
        },
      },
    },
  },

  sources = {
    providers = {
      snippets = { score_offset = 90 },
      lsp = { score_offset = 85 },
      path = { score_offset = -10 },
      buffer = { score_offset = -20 },
    },
  },
  fuzzy = { implementation = "lua" },
})

-- Typst Preview

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

-- keymaps
local m = vim.keymap.set

m("n", "<Esc>", "<cmd>noh<CR>", { silent = true })
m({ "n", "v" }, "k", [[v:count || mode(1)[0:1] == "no" ? "k" : "gk"]], { expr = true })
m({ "n", "v" }, "j", [[v:count || mode(1)[0:1] == "no" ? "j" : "gj"]], { expr = true })
m({ "n", "v" }, "<leader>y", [["+y]])
m("n", "<leader>Y", [["+Y]])
m("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
m("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
m("n", "J", "mzJ`z")
m("v", "<", "<gv")
m("v", ">", ">gv")
m("n", "<leader>tt", "<Cmd>tabnew<CR>")
m("n", "<leader>tw", "<Cmd>tabclose<CR>")
m("n", "<A-l>", "<Cmd>tabnext<CR>")
m("n", "<A-h>", "<Cmd>tabprevious<CR>")

-- autocmds
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

require("vim._core.ui2").enable()
