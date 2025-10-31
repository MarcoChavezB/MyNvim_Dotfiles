return {
	"nvim-treesitter/nvim-treesitter",

	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"windwp/nvim-ts-autotag",
		"windwp/nvim-autopairs",
	},


	build = ":TSUpdate",
	event = "bufWinEnter",

	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"html",
				"css",
				"java",
				"javascript",
				"typescript",
				"python",
				"markdown",
        "kotlin",
        "c_sharp",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			autotag = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
			rainbow = {
				enable = true,
			},
		})
	end,
}
