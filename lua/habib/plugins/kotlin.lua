return {
  -- Asegúrate de que el LSP esté configurado
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = {}, -- Configuración básica del LSP
      },
    },
  },
  -- Añade soporte para lenguajes específicos
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "kotlin", -- Activa Kotlin en Treesitter
      },
    },
  },
{
  "neovim/nvim-lspconfig",
  config = function()
    require'lspconfig'.kotlin_language_server.setup{}
  end
},
  -- Opcional: Mejoras en el formateo
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources, {
        null_ls.builtins.formatting.ktlint, -- Usa Ktlint para el formateo
      })
    end,
  },
}
