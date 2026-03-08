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
    pattern = { "*.js", "*.ts", "*.tsx", "*.jsx" },
    group = format_group,
    callback = function(_)
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.typ", "*.md" },
    group = spell_group,
    callback = function(_)
        vim.cmd("setlocal spell spelllang=en_ca")
    end,
})
