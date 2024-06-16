return {
	"akinsho/toggleterm.nvim",

	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			size = 10,
			open_mapping = [[<c-\>]],
			shade_filetypes = {},
			shade_terminal = true,
			shading_factor = 1,
			start_in_insert = true,
			persist_size = true,
			direction = "tab",
			autochdir = true,
		})
	end,
}
