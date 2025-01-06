return {
	"nvim-tree/nvim-tree.lua",

	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local nvimtree = require("nvim-tree")
		nvimtree.setup({
			auto_reload_on_write = true,

			view = {
				float = {
					enable = true, -- Activa la ventana flotante
					open_win_config = {
						relative = "editor", -- Relativo al editor completo
						border = "rounded",  -- Estilo del borde (opciones: "none", "single", "double", "rounded", "shadow")
						width = 90,          -- Ancho de la ventana flotante
						height = 20,         -- Altura de la ventana flotante
						row = math.floor((vim.o.lines - 50) / 2), -- Centrar verticalmente
						col = math.floor((vim.o.columns - 90) / 2), -- Centrar horizontalmente
					},
				},
				width = 50, -- Ancho si la ventana flotante está desactivada
				number = true,
				relativenumber = true,
			},

			filters = {
				dotfiles = true,
				custom = { "node_modules", ".git" },
			},

			renderer = {
				add_trailing = false,
				group_empty = false,
				highlight_git = false,
				full_name = false,
				highlight_opened_files = "none",
				highlight_modified = "none",
				root_folder_label = ":~:s?$?/..?",
				indent_width = 2,

				indent_markers = {
					enable = true, -- Habilita las líneas del árbol
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},

				icons = {
					webdev_colors = true,
					git_placement = "before",
					modified_placement = "after",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
						modified = true,
					},

					glyphs = {
						default = "",
						symlink = "",
						bookmark = "",
						modified = "●",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},

						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				}, -- Fin de la configuración de íconos

				special_files = {
					"Cargo.toml",
					"Makefile",
					"README.md",
					"readme.md",
				},
				symlink_destination = true,
			}, -- Fin de la configuración de renderizado

			ui = {
				confirm = {
					remove = true,
					trash = true,
				},
			},
		})
	end,
}
