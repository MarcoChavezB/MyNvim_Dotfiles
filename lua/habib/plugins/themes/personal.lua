local M = {}

M.colors = {
  bg = "#000000",  -- Fondo negro
  fg = "#ffffff",  -- Texto blanco
  comment = "#ff0000", -- Comentarios en rojo
  gray = "#6c7086", -- Gris para otros textos
}

M.setup = function()
  local colors = M.colors
  -- Fondo y texto principal
  vim.api.nvim_set_hl(0, "Normal", { bg = colors.bg, fg = colors.fg }) -- Fondo negro, texto blanco

  -- Comentarios en rojo y subrayado
  vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment, underline = true })

  -- Otros grupos de resalte
  vim.api.nvim_set_hl(0, "Error", { fg = colors.comment, bold = true }) -- Errores también en rojo
  vim.api.nvim_set_hl(0, "String", { fg = colors.gray }) -- Cadenas en gris
  vim.api.nvim_set_hl(0, "Keyword", { fg = colors.gray, bold = true }) -- Palabras clave en gris y negrita
  vim.api.nvim_set_hl(0, "Function", { fg = colors.gray, italic = true }) -- Funciones en gris e itálica
  vim.api.nvim_set_hl(0, "Type", { fg = colors.gray }) -- Tipos en gris
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.gray }) -- Bordes de Telescope en gris
  vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = colors.gray, fg = colors.fg, bold = true }) -- Selección en gris claro

  -- Transparencia opcional
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" }) -- Ventanas flotantes transparentes
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.gray }) -- Bordes flotantes en gris
end

return M
