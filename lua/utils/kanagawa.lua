
return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- alta prioridad para aplicar el esquema antes que otros plugins
    config = function()
      require("kanagawa").setup({
        transparent = true,
        theme = "lotus",
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })
      -- Aplicar el esquema de colores
      vim.cmd("colorscheme kanagawa")

      -- Quitar fondo a varios grupos para transparencia total
      local groups = {
        "Normal", "NormalNC", "NormalFloat",
        "NonText", "EndOfBuffer", "LineNr",
        "SignColumn", "VertSplit", "StatusLine",
        "StatusLineNC", "MsgArea", "TelescopeNormal",
        "TelescopeBorder", "FloatBorder", "Pmenu",
        "PmenuSel", "WinSeparator",
        "TabLine", "TabLineFill", "TabLineSel"
      }

      for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
      end

      -- Visual: fondo suave para selección
      vim.api.nvim_set_hl(0, "Visual", { bg = "#1a1a1a" })
    end,
  },
}
