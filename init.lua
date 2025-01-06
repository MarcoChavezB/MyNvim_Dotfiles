require("habib.core")




-- Configuración de null-ls para ejecutar ktlint
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Configuración de ktlint
    null_ls.builtins.formatting.ktlint.with({
      command = "ktlint",
      args = { "--format", "--stdin" },
    }),
  },
})





-- Crear un comando personalizado para ejecutar ktlint
vim.api.nvim_create_user_command('Ktlint', function()
  vim.fn.system("ktlint -F " .. vim.fn.expand('%'))
  vim.cmd("edit")  -- Recargar el archivo para ver los cambios
end, { nargs = 0 })
