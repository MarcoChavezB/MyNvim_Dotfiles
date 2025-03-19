return {
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
}
