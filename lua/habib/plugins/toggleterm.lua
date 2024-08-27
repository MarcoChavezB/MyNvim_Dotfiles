return {
	"akinsho/toggleterm.nvim",

	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			size = 100,
			open_mapping = [[<c-\>]],
			shade_filetypes = {},
			shade_terminal = true,
			shading_factor = 1,
			start_in_insert = true,
			persist_size = true,
--[[       direction = 'vertical' | 'horizontal' | 'tab' | 'float', ]]
			direction = "float",
			autochdir = true,

      float_opts = {
        border = 'curved',
        width = 100,
        height = 20,
        title_pos = 'right'
      },
		})
	end,
}
