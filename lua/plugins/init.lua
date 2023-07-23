return {
    { "kana/vim-textobj-entire",     dependencies = { "kana/vim-textobj-user" } }, -- select entire buffer
    {
        "kazhala/close-buffers.nvim",
        config = function()
            vim.keymap.set("n", "<leader>q", function()
                require("close_buffers").delete({ type = "this" }) -- Delete the current buffer
            end)
        end,
    },
    { "vim-scripts/restore_view.vim" },
    { "nvim-lua/plenary.nvim" }, -- useful lua functions
    { "unblevable/quick-scope" }, -- highlight unique chars
    { "nvim-lua/popup.nvim" },
    { "tpope/vim-fugitive" },
    { "tpope/vim-rhubarb" },
    { "tpope/vim-unimpaired" },
    { "tpope/vim-dadbod" },
    {
        "kristijanhusak/vim-dadbod-ui",
        config = function()
            vim.g.db_ui_save_location = "~/Dropbox/db_ui_queries"
        end,
    },
    { "machakann/vim-sandwich" }, -- vim surround alternative
    { "mg979/vim-visual-multi" },
    { "lambdalisue/suda.vim" },
    { "nanozuki/tabby.nvim",    config = true },
    { "sindrets/diffview.nvim", opts = { file_panel = { win_config = { position = "left" } } } },
    {
        "goolord/alpha-nvim",
        config = function()
            require("alpha").setup(require("alpha.themes.dashboard").config)
        end,
    },
    { "Th3Whit3Wolf/one-nvim" },
    {
        "szw/vim-maximizer",
        init = function()
            vim.keymap.set("n", "<leader>mm", ":MaximizerToggle!<CR>")
        end,
    }, -- maximize and restore windows
    {
        "feline-nvim/feline.nvim",
        config = function()
            require("plugins.feline.feline")
        end,
    },
    {
        "kyazdani42/nvim-tree.lua",
        init = function()
            vim.keymap.set("n", "<leader>no", ":NvimTreeToggle<CR>")
            vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>")
        end,
        config = true,
    },
    { "knubie/vim-kitty-navigator",   build = "cp ./*.py ~/.config/kitty/" }, -- consistent navigation between vim and terminal splits
    { "fladson/vim-kitty" },                                             -- syntax highlighting for Kitty config
    { "natecraddock/workspaces.nvim", opts = { hooks = { open = { "NvimTreeOpen", "Telescope find_files" } } } },
    {
        "gabrielpoca/replacer.nvim",
        init = function()
            vim.api.nvim_set_keymap("n", "<Leader>gr", ':lua require("replacer").run()<cr>', { silent = true })
        end,
    },
    --[[ { ]]
    --[[ 	"RRethy/vim-illuminate", ]]
    --[[ 	config = function() ]]
    --[[ 		require("illuminate").configure({}) ]]
    --[[ 	end, ]]
    --[[ }, ]]
    { "mbbill/undotree" },
    { "kyazdani42/nvim-web-devicons" },
    { "neanias/everforest-nvim" },
    {
        "Shatur/neovim-ayu",
        init = function()
            require("ayu").setup({})
        end,
    },
    { "sam4llis/nvim-tundra" },
    { "lukas-reineke/indent-blankline.nvim" }, -- indentation guides
    { "RishabhRD/nvim-cheat.sh",            dependencies = "RishabhRD/popfix" },
    { "nanotee/sqls.nvim",                  ft = "sql" },
    { "weilbith/nvim-code-action-menu" },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    { "nvim-lua/lsp-status.nvim" }, -- generate statusline components from the LSP client.
    { "jose-elias-alvarez/typescript.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "ThePrimeagen/refactoring.nvim",     config = true },
    { "m4xshen/autoclose.nvim",            opts = { {} } },
    {
        "simrat39/symbols-outline.nvim",
        opts = { highlight_hovered_item = true },
        init = function()
            vim.keymap.set("n", "<leader>xo", "<cmd>SymbolsOutline<CR>")
        end,
    },
    { "folke/todo-comments.nvim",        dependencies = "nvim-lua/plenary.nvim",    config = true },
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui",            dependencies = { "mfussenegger/nvim-dap" } },
    { "theHamsta/nvim-dap-virtual-text", config = true },
    { "leoluz/nvim-dap-go" },
    { "mxsdev/nvim-dap-vscode-js",       dependencies = { "mfussenegger/nvim-dap" } },
    {
        "microsoft/vscode-js-debug",
        opt = true,
        build = "npm install --legacy-peer-deps && npm run compile",
    },
    { "preservim/vim-markdown" },
    {
        "Exafunction/codeium.vim",
        init = function()
            vim.keymap.set("i", "<c-.>", function()
                return vim.fn["codeium#CycleCompletions"](1)
            end, { expr = true })
            vim.keymap.set("i", "<c-,>", function()
                return vim.fn["codeium#CycleCompletions"](-1)
            end, { expr = true })
            vim.keymap.set("i", "<c-x>", function()
                return vim.fn["codeium#Clear"]()
            end, { expr = true })
            vim.keymap.set("i", "<c-cr>", function()
                return vim.fn["codeium#Accept"]()
            end, { expr = true })
        end,
    },
}
