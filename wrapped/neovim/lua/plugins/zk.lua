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

local function open_in_obsidian()
    local file = vim.fn.expand("%:p")
    if file == "" then
        vim.notify("No file name", vim.log.levels.WARN)
        return
    end

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

return {
    "zk-org/zk-nvim",
    ft = "markdown",

    keys = {
        {
            "<leader>op",
            open_in_obsidian,
            desc = "Open note in Obsidian preview",
        },

        {
            "<leader>on",
            function()
                require("zk").new({ title = vim.fn.input("Title: ") })
            end,
            desc = "New ZK note",
        },

        {
            "<leader>oo",
            "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",
            desc = "Open ZK notes",
        },

        {
            "<leader>ot",
            "<Cmd>ZkTags<CR>",
            desc = "ZK tags",
        },

        {
            "<leader>of",
            function()
                require("zk").notes({
                    sort = { "modified" },
                    match = { vim.fn.input("Search: ") },
                })
            end,
            desc = "Search ZK notes",
        },

        {
            "<leader>of",
            ":'<,'>ZkMatch<CR>",
            mode = "v",
            desc = "Match selection",
        },

        {
            "<leader>ob",
            "<Cmd>ZkBacklinks<CR>",
            desc = "ZK backlinks",
        },
    },

    config = function()
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
    end,
}
