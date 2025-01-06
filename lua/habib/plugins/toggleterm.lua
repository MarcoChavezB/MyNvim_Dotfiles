return {
	"akinsho/toggleterm.nvim",

	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			size = 100,
			open_mapping = [[<c-2>]],
			shade_filetypes = {},
			shade_terminal = true,
			shading_factor = 1,
			start_in_insert = true,
			persist_size = true,
			direction = "vertical",
			autochdir = true,

      float_opts = {
        border = 'curved',
        width = 10,
        height = 20,
        title_pos = 'bottom'
      },
		})
	end,
}
