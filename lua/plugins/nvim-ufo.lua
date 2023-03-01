return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
        {
            "luukvbaal/statuscol.nvim",
            config = function()
                --[[ https://github.com/luukvbaal/statuscol.nvim/issues/27 ]]
                local builtin = require("statuscol.builtin")
                require("statuscol").setup({
                    relculright = true,
                    segments = {
                        { text = { "%s" },                       click = "v:lua.ScSa" },
                        { text = { builtin.lnumfunc },           click = "v:lua.ScLa" },
                        { text = { " ", builtin.foldfunc, " " }, click = "v:lua.ScFa" },
                    },
                })
            end,
        },
    },
    config = function()
        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end,
        })

        vim.keymap.set("n", "zR", require("ufo").openAllFolds)
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    end,
}
