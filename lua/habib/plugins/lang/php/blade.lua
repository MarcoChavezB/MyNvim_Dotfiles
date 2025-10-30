return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        "emmet_ls", -- para autocompletar en Blade
        -- "blade_formatter" no está en mason, se instala manual con npm
      },
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end

    mason_lspconfig.setup_handlers({
      -- Emmet para Blade + HTML + CSS
      ["emmet_ls"] = function()
        lspconfig.emmet_ls.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          filetypes = { "html", "blade", "php", "css", "javascriptreact", "typescriptreact" },
        })
      end,
    })

    -- Blade formatter (se instala manualmente con npm)
    -- npm install -g blade-formatter
    lspconfig.blade_formatter = {
      formatCommand = "blade-formatter --write --stdin",
      formatStdin = true,
    }
  end,
}
