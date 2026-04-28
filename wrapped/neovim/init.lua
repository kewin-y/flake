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
vim.opt.winborder = "single"
vim.opt.pumborder = "single"
vim.opt.whichwrap:append("<>[]hl")
vim.opt.relativenumber = true
vim.opt.autoread = true
vim.opt.laststatus = 3
vim.o.pumheight = 7
vim.o.smartcase = true
vim.o.ignorecase = true
vim.opt.completeopt = { "menuone", "noselect", "fuzzy" }

vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.icons" },
  { src = "https://github.com/nvim-mini/mini.hipatterns" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/zk-org/zk-nvim" },
  { src = "https://github.com/obsidian-nvim/obsidian.nvim", version = vim.version.range("*") },
  { src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("^2") },
  { src = "https://github.com/silentium-theme/silentium.nvim" },
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
  "marksman",
}

for _, server in pairs(servers) do
  vim.lsp.enable(server)
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("Lsp", {}),

  callback = function(ev)
    local lsp = vim.lsp.buf

    vim.keymap.set("n", "grd", lsp.definition, { desc = "Goto Definition" })
    vim.keymap.set("n", "gre", lsp.declaration, { desc = "Goto Declaration" })
    vim.keymap.set("n", "gws", lsp.workspace_symbol, { desc = "Workspace Symbol" })

    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf)
    end
  end,
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

vim.keymap.set("n", "<leader>fm", function()
  conform.format({ async = true })
end, { desc = "Format buffer using conform" })

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

-- obsidian
require("obsidian").setup({
  legacy_commands = false,
  workspaces = {
    {
      name = "notes",
      path = "~/Documents/ksync/notes",
    },
  },
  templates = {
    folder = "templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M:%S",
  },
  picker = {
    name = "fzf-lua",
  },
  note_id_func = function(title)
    local charset = "abcdefghijklmnopqrstuvwxyz0123456789"
    local prefix = ""
    for _ = 1, 4 do
      local rand = math.random(1, #charset)
      prefix = prefix .. string.sub(charset, rand, rand)
    end
    if title ~= nil then
      return prefix .. "_" .. title
    else
      return prefix
    end
  end,
  frontmatter = {
    enabled = false,
  },
  callbacks = {
    enter_note = function(_)
      vim.keymap.set(
        "n",
        "<leader>ob",
        "<Cmd>Obsidian backlinks<CR>",
        { buffer = true, desc = "Obsidian backlinks" }
      )
      vim.keymap.set(
        "n",
        "<leader>ot",
        "<Cmd>Obsidian tags<CR>",
        { buffer = true, desc = "Obsidian backlinks" }
      )
    end,
  },
})

vim.keymap.set(
  "n",
  "<leader>on",
  "<Cmd>Obsidian new_from_template<CR>",
  { desc = "New Obsidian note" }
)
vim.keymap.set(
  "n",
  "<leader>oo",
  "<Cmd>Obsidian quick_switch<CR>",
  { desc = "Open Obsidian notes" }
)
vim.keymap.set("n", "<leader>op", "<Cmd>Obsidian open<CR>", { desc = "Open in Obsidian App" })

-- luasnip
local ls = require("luasnip")
ls.setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = config_dir .. "/snippets/" })

local function feedkeys(keys)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), "n", true)
end

vim.keymap.set({ "i" }, "<C-l>", function()
  ls.expand()
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if vim.snippet.active({ direction = 1 }) then
    vim.snippet.jump(1)
  elseif ls.locally_jumpable(1) then
    ls.jump(1)
  else
    feedkeys("<C-j>")
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if vim.snippet.active({ direction = -1 }) then
    vim.snippet.jump(-1)
  elseif ls.locally_jumpable(-1) then
    ls.jump(-1)
  else
    feedkeys("<C-k>")
  end
end, { silent = true })

-- keymaps
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "k", [[v:count || mode(1)[0:1] == "no" ? "k" : "gk"]], { expr = true })
vim.keymap.set({ "n", "v" }, "j", [[v:count || mode(1)[0:1] == "no" ? "j" : "gj"]], { expr = true })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<leader>tt", "<Cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>tw", "<Cmd>tabclose<CR>")
vim.keymap.set("n", "<A-l>", "<Cmd>tabnext<CR>")
vim.keymap.set("n", "<A-h>", "<Cmd>tabprevious<CR>")

-- autocmds
local format_group = vim.api.nvim_create_augroup("Format", {})
local spell_group = vim.api.nvim_create_augroup("Spell", {})

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

local silentium = require("silentium")
silentium.setup({ accent = silentium.accents.violet })
vim.cmd.colorscheme("silentium")

-- Mandatory
vim.api.nvim_set_hl(0, "StatusLine", { link = "StatusLineNC" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = silentium.colors.dark_gray })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
