-- Credit: https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html

local palette = require("tinted-nvim").get_palette()

if palette ~= nil then
    -- Main StatusLine color
    vim.api.nvim_set_hl(0, "StatusLine", { fg = palette.base04, bg = palette.base01 })
    vim.api.nvim_set_hl(0, "StatusLineLighter", { fg = palette.base04, bg = palette.base02 })

    -- Mode Indicator Colors
    vim.api.nvim_set_hl(0, "StatusLineAccent", { fg = palette.base00, bg = palette.base0D })
    vim.api.nvim_set_hl(0, "StatusLineInsertAccent", { fg = palette.base00, bg = palette.base0E })
    vim.api.nvim_set_hl(0, "StatusLineVisualAccent", { fg = palette.base00, bg = palette.base0B })
    vim.api.nvim_set_hl(0, "StatusLineReplaceAccent", { fg = palette.base00, bg = palette.base08 })
    vim.api.nvim_set_hl(0, "StatusLineCmdLineAccent", { fg = palette.base00, bg = palette.base0A })
    vim.api.nvim_set_hl(0, "StatusLineTerminalAccent", { fg = palette.base00, bg = palette.base0A })
end

local modes = {
    ["n"] = "NORMAL",
    ["no"] = "NORMAL",
    ["v"] = "VISUAL",
    ["V"] = "VISUAL LINE",
    ["\22"] = "VISUAL BLOCK",
    ["s"] = "SELECT",
    ["S"] = "SELECT LINE",
    ["\19"] = "SELECT BLOCK",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rv"] = "VISUAL REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "VIM EX",
    ["ce"] = "EX",
    ["r"] = "PROMPT",
    ["rm"] = "MOAR",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
}

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format("%s", modes[current_mode] or "UNKNOWN"):upper()
end

local function update_mode_colors()
    local current_mode = vim.api.nvim_get_mode().mode
    local mode_color = "%#StatusLineAccent#"

    if current_mode == "n" then
        mode_color = "%#StatusLineAccent#"
    elseif current_mode == "i" or current_mode == "ic" then
        mode_color = "%#StatusLineInsertAccent#"
    elseif
        current_mode == "v"
        or current_mode == "V"
        or current_mode == "\22"
        or current_mode == ""
    then
        mode_color = "%#StatusLineVisualAccent#"
    elseif current_mode == "R" then
        mode_color = "%#StatusLineReplaceAccent#"
    elseif current_mode == "c" then
        mode_color = "%#StatusLineCmdLineAccent#"
    elseif current_mode == "t" then
        mode_color = "%#StatusLineTerminalAccent#"
    end

    return mode_color
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
    return string.format("%s", vim.bo.filetype)
end

_G.StatusLine = {}

_G.StatusLine.active = function()
    return table.concat({
        update_mode_colors(),
        " ",
        "%#StatusLine#",
        "  ",
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
        "  ",
        update_mode_colors(),
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
