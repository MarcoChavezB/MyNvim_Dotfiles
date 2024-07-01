return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    requires = {
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local luasnip = require("luasnip")

        luasnip.config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
        })

        require("habib.core.snippets")

        require("luasnip/loaders/from_vscode").lazy_load()
    end,
}

