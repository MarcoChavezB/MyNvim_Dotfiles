return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "dartls",
        "phpactor",   -- o "intelephense"
        "blade",
        "tsserver",   -- JS / TS / jQuery
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
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end,

      -- Dart / Flutter
      ["dartls"] = function()
        lspconfig.dartls.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          cmd = { "dart", "language-server", "--protocol=lsp" },
          init_options = {
            onlyAnalyzeProjectsWithOpenFiles = true,
            suggestFromUnimportedLibraries = true,
            closingLabels = true,
          },
        })
      end,
       
      -- php / laravel
      ["phpactor"] = function()
        lspconfig.phpactor.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          init_options = {
            ["language_server_php_bin"] = "php",
            ["language_server_root"] = vim.fn.getcwd(),
            ["use_composer_autoload"] = true,
          },
        })
      end,

      -- JavaScript
      ["tsserver"] = function()
        lspconfig.tsserver.setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end,

      -- gestion de errores
      ["intelephense"] = function()
        lspconfig.intelephense.setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end,


      ["emmet_ls"] = function()
        lspconfig.emmet_ls.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          filetypes = { "html", "blade", "php" }, -- le decimos que trabaje con blade
        })
      end,
    })
  end,
}
