-- Credit: https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html

local palette = require("tinted-nvim").get_palette()

if palette ~= nil then
  vim.api.nvim_set_hl(0, "StatusLine", { fg = palette.base04, bg = palette.base01 })
end

local modes = {
  ["n"] = "normal",
  ["no"] = "normal",
  ["v"] = "visual",
  ["V"] = "visual line",
  ["\22"] = "visual block",
  ["s"] = "select",
  ["S"] = "select line",
  ["\19"] = "select block",
  ["i"] = "insert",
  ["ic"] = "insert",
  ["R"] = "replace",
  ["Rv"] = "visual replace",
  ["c"] = "command",
  ["cv"] = "vim ex",
  ["ce"] = "ex",
  ["r"] = "prompt",
  ["rm"] = "moar",
  ["r?"] = "confirm",
  ["!"] = "shell",
  ["t"] = "terminal",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format("%s", modes[current_mode] or "unknown"):lower()
end

local function filename()
  local fname = vim.fn.expand("%:t")
  if fname == "" then
    return ""
  end
  return fname
end

local function lsp()
  local count = {}
  local levels = {
    errors = vim.diagnostic.severity.ERROR,
    warnings = vim.diagnostic.severity.WARN,
    info = vim.diagnostic.severity.INFO,
    hints = vim.diagnostic.severity.HINT,
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = "  " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = "  " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = "  " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = "  " .. count["info"]
  end

  return errors .. warnings .. hints .. info
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return "%l:%c"
end

local function filetype()
  return string.format("%s", vim.bo.filetype):lower()
end

_G.StatusLine = {}

_G.StatusLine.active = function()
  return table.concat({
    " ",
    mode(),
    "  ",
    filename(),
    "  ",
    "%=",
    lsp(),
    "  ",
    filetype(),
    "  ",
    lineinfo(),
    " ",
  })
end

_G.StatusLine.inactive = function()
  return " %F"
end

_G.StatusLine.oil = function()
  return "   Oil"
end

local statusline_group = vim.api.nvim_create_augroup("CustomStatusLine", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  group = statusline_group,
  pattern = "*",
  command = "setlocal statusline=%!v:lua.StatusLine.active()",
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  group = statusline_group,
  pattern = "*",
  command = "setlocal statusline=%!v:lua.StatusLine.inactive()",
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "FileType" }, {
  group = statusline_group,
  pattern = "oil",
  command = "setlocal statusline=%!v:lua.StatusLine.oil()",
})
