return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "Nvim Tree",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
				diagnostics = "nvim_lsp",
				separator_style = { "", "" },
				--modified_icon = "●",
				modified_icon = "󰊠",
				show_close_icon = false,
				show_buffer_close_icons = false,
			},
		})
	end,
}
