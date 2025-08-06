require("habib.core")
vim.env.PATH = vim.env.PATH .. ':/home/marco/go/bin'


init = function()
  vim.g.db_ui_use_nerd_fonts = 1

  vim.g.dadbod_adapter_mssql = {
    name = 'mssql',
    command = function(params)
      local user = params.user or 'sa'
      local pass = params.pass or ''
      local host = params.host or 'localhost'
      local db = params.db or 'master'
      local port = params.port or '1433'
      return string.format("sqlcmd -S %s,%s -U %s -P %s -d %s -W -s \",\" -Q",
        host, port, user, pass, db)
    end
  }
end

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
