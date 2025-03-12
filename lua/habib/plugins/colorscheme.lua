return {
  --[[ {
    dir = "~/config/nvim/lua/habib/plugins/themes",
    priority = 1000,
    config = function()
      require("habib.plugins.themes.personal").setup()
    end,
  }, ]]


  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        transparent = true,
        theme = "lotus", -- Opciones: "wave", "dragon", "lotus"
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none", -- Evita fondos en números de línea y signos
              }
            }
          }
        }
      })

      -- Aplicar el esquema de colores
      vim.cmd([[colorscheme kanagawa]])

      -- Ajustes adicionales después de cargar el esquema
      local highlight_groups = {
        "Normal", "NonText", "EndOfBuffer", "LineNr",
        "SignColumn", "VertSplit", "StatusLineNC"
      }

      for _, group in ipairs(highlight_groups) do
        vim.cmd("hi " .. group .. " guibg=NONE ctermbg=NONE")
        vim.cmd [[hi Visual guibg=#101010 guifg=NONE ctermbg=60 ctermfg=NONE]]
      end
    end,
  },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- Opciones: "storm", "moon", "night", "day"
        transparent = true, -- Habilita fondo transparente
        terminal_colors = true, -- Aplica colores en el terminal
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "transparent", -- "dark", "transparent", "normal"
          floats = "dark", -- "dark", "transparent", "normal"
        },
      })

      vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi NonText guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi EndOfBuffer guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi LineNr guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi SignColumn guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi VertSplit guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi StatusLineNC guibg=NONE ctermbg=NONE]])
      end,
  },

  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
      -- light or dark
      vim.o.background = "dark"
      vim.cmd("let g:gruvbox_material_background= 'hard'")
      vim.cmd("let g:gruvbox_material_transparent_background=2")
      vim.cmd("let g:gruvbox_material_diagnostic_line_highlight=1") 
      vim.cmd("let g:gruvbox_material_diagnostic_virtual_text='colored'")
      vim.cmd("let g:gruvbox_material_enable_bold=1")
      vim.cmd("let g:gruvbox_material_enable_italic=1")
      -- changing bg and border colors
      vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
      vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
      -- Uncomment the line below to set the gruvbox-material colorscheme
      -- vim.cmd([[colorscheme gruvbox-material]])
    end,
  },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.o.background = "dark" -- opcional: establece el fondo oscuro
--[[       vim.cmd.colorscheme("lackluster-hack") -- Puedes cambiarlo a "lackluster" o "lackluster-hack" ]]
      -- Transparencia de fondo
      vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi NonText guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi EndOfBuffer guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi LineNr guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi SignColumn guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi VertSplit guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi StatusLineNC guibg=NONE ctermbg=NONE]])
    end,
  },
  {
    "xiantang/darcula-dark.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    priority = 1000,
    config = function()
      vim.o.background = "dark" -- Establece el fondo oscuro

      -- Transparencia de fondo
      vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi NonText guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi EndOfBuffer guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi LineNr guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi SignColumn guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi VertSplit guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi StatusLineNC guibg=NONE ctermbg=NONE]])
    end,
  }




}
