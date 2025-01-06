
return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("null-ls").setup({
        sources = {
          -- Configuración de ktlint con null-ls
          require("null-ls").builtins.formatting.ktlint.with({
            command = "ktlint",
            args = { "--format", "--stdin" },
          }),
        },
      })
    end,
  },
}
