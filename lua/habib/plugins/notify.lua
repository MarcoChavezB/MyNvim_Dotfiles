--[[ return {

	"rcarriga/nvim-notify",

	config = function()
		vim.opt.termguicolors = true
		vim.notify = require("notify")
		local notify = require("notify")

		notify.setup({
			minimum_width = 0,
			background_colour = "#1d2021",
			stages = "fade_in_slide_out",
			compact = "compact",
			timeout = 1,
			fps = 60,
		})
	end,
} ]]


return {
	"rcarriga/nvim-notify",
	config = function()
		-- Comentamos o quitamos la asignación a notify
		-- vim.notify = require("notify")

		-- Asignamos una función vacía para desactivar notificaciones
		vim.notify = function() end
	end,
}
