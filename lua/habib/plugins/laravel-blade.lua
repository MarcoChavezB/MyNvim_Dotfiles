
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "html", "blade" }, -- Agrega 'blade'
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
  {
    "jwalton512/vim-blade", -- Complemento para soporte de Blade
    ft = "blade",
  },
  {
    "EmranMR/tree-sitter-blade"
  }
}

