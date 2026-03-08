local m = vim.keymap.set

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
