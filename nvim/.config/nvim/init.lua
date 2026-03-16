vim.o.number = true
vim.o.relativenumber = false
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.swapfile = false

vim.cmd("colorscheme retrobox")

vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/echasnovski/mini.icons" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/goolord/alpha-nvim" },
    -- cmp shitpost
    -- deps
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    -- cmp core
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    -- cmp deps
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/hrsh7th/cmp-cmdline" },
    { src = "https://github.com/hrsh7th/cmp-vsnip" },
    { src = "https://github.com/hrsh7th/vim-vsnip" },
    { src = "https://github.com/petertriho/cmp-git" },
})

require "mini.icons".setup()
require "mini.pick".setup()
require "oil".setup({
    view_options = { show_hidden = true }
})
require "lualine".setup({
    theme = { "gruvbox" }
})


local startify = require "alpha.themes.startify"
-- local handle = io.popen("toilet -f $(fd . -e .tlf -e .flf /usr/share/figlet/fonts | shuf -n1) korandnik")
-- local result = handle:read("*a")
-- handle:close()

-- local custom_header = {
--     type = "text",
--     val = vim.split(result, "\n"),
--     opts = {
--         position = "center",
--         hl = "Type",
--     },
-- }
--
--
-- startify.config.layout[2] = result
require "alpha".setup(
    startify.config
)




vim.lsp.enable({ "lua_ls", "ruff", "tinymist", "clangd" })
vim.lsp.config("lua_ls",
    {
        settings = {
            Lua = {
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true)
                }
            }
        }
    })

-- cmp shitpost
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    window = {
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
    }, {
        { name = "buffer" },
    }),
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "git" },
    }, {
        { name = "buffer" },
    }),
})
require("cmp_git").setup()

--

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
    matching = { disallow_symbol_nonprefix_matching = false },
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("tinymist", {
    capabilities = capabilities,
})
vim.lsp.config("ruff", {
    capabilities = capabilities,
})
vim.lsp.config("lus_ls", {
    capabilities = capabilities,
})
vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = { "clangd", "--clang-tidy" },
})

-- cmp shitpost

vim.g.mapleader = " "

vim.keymap.set('n', '<Leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<Leader>w', ':write<CR>')
vim.keymap.set('n', '<Leader>q', ':quit<CR>')
vim.keymap.set('n', '<Leader>e', function()
    vim.cmd("Oil")
end)
vim.keymap.set('n', '<Leader><S-e>', function()
    MiniPick.builtin.cli(
        { command = { 'fd', '-H' } },
        {
            source = {
                show = function(buf_id, items, query)
                    MiniPick.default_show(buf_id, items, query, {
                        show_icons = true,
                    })
                end,
            },
        }
    )
end)
vim.keymap.set('n', '<Leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<Leader>s', function()
    vim.lsp.buf.format()
    vim.cmd.write()
end
)
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
