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

vim.o.completeopt = "fuzzy,menuone,noselect" -- add 'popup' for docs (sometimes)
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
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
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
  "basedpyright",
  "tailwindcss",
  "hls",
}

for _, server in pairs(servers) do
  vim.lsp.enable(server)
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("KevinLsp", {}),

  callback = function(ev)
    local lsp = vim.lsp.buf

    vim.keymap.set("n", "grd", lsp.definition, { desc = "Goto Definition" })
    vim.keymap.set("n", "gre", lsp.declaration, { desc = "Goto Declaration" })
    vim.keymap.set("n", "gws", lsp.workspace_symbol, { desc = "Workspace Symbol" })

    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
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
    python = { "ruff" },
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

local zk_group = vim.api.nvim_create_augroup("ZK", {})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = zk_group,
  callback = function(_)
    local cwd = vim.fn.getcwd()

    if vim.fn.isdirectory(cwd .. "/.zk") ~= 1 then
      return
    end

    local function new_note()
      require("zk").new({ title = vim.fn.input("Title: ") })
    end

    local function open_note()
      require("zk").notes({ sort = { "modified" }, match = { vim.fn.input("Search: ") } })
    end

    vim.keymap.set("n", "<leader>on", new_note, { desc = "New ZK note" })
    vim.keymap.set(
      "n",
      "<leader>oo",
      "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",
      { desc = "Open ZK notes" }
    )
    vim.keymap.set("n", "<leader>ot", "<Cmd>ZkTags<CR>", { desc = "ZK tags" })
    vim.keymap.set("n", "<leader>of", open_note, { desc = "Search ZK notes" })
    vim.keymap.set("v", "<leader>of", ":'<,'>ZkMatch<CR>", { desc = "Match selection" })
    vim.keymap.set("n", "<leader>ob", "<Cmd>ZkBacklinks<CR>", { desc = "ZK backlinks" })
  end,
})

-- snippets
require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = config_dir .. "/snippets/" })

local ls = require("luasnip")

vim.keymap.set({ "i" }, "<C-CR>", function()
  ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-u>", function()
  ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-i>", function()
  ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-e>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

-- keymaps
local m = vim.keymap.set

m("i", "<C-h>", "<Left>", { desc = "move left" })
m("i", "<C-l>", "<Right>", { desc = "move right" })
m("i", "<C-j>", "<Down>", { desc = "move down" })
m("i", "<C-k>", "<Up>", { desc = "move up" })
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
