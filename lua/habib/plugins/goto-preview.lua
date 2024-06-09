return {
	"rmagatti/goto-preview",
	config = function()
		require("goto-preview").setup({
			width = 120, -- Ancho de la ventana flotante
			height = 25, -- Alto de la ventana flotante
			border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Estilo del borde
			default_mappings = false, -- Deshabilitar mapeos predeterminados si quieres definir los tuyos
			debug = false, -- Habilitar modo de depuración
			opacity = nil, -- Opacidad de la ventana flotante, si soportado
			resizing_mappings = false, -- Habilitar mapeos de redimensionamiento de la ventana flotante
			post_open_hook = nil, -- Función que se ejecuta después de abrir la ventana flotante
			references = {
				telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
			},
			focus_on_open = true, -- Enfocar la ventana flotante cuando se abre
			dismiss_on_move = false, -- Cerrar la ventana flotante cuando te mueves fuera de ella
			force_close = true, -- Forzar el cierre de la ventana flotante si está abierta
			bufhidden = "wipe", -- Opción bufhidden de la ventana flotante
		})
	end,
}
