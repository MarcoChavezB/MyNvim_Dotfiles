
return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- opcional, UI bonita
  },
  config = function()
    local flutter_tools = require("flutter-tools")

    flutter_tools.setup({
      ui = {
        border = "rounded",
        notification_style = "plugin",
      },
      decorations = {
        statusline = {
          app_version = true,
          device = true,
        },
      },
      debugger = { -- necesitas `dart debug_adapter`
        enabled = true,
        run_via_dap = true,
      },
      outline = { auto_open = false },
      lsp = {
        color = { enabled = true },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(_, bufnr)
          local opts = { buffer = bufnr, noremap = true, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      },
    })

    -- Comandos útiles
    vim.keymap.set("n", "<leader>fr", ":FlutterRun<CR>")
    vim.keymap.set("n", "<leader>fd", ":FlutterDevices<CR>")
    vim.keymap.set("n", "<leader>fq", ":FlutterQuit<CR>")
    vim.keymap.set("n", "<leader>fh", ":FlutterHotReload<CR>")
    vim.keymap.set("n", "<leader>fR", ":FlutterHotRestart<CR>")
  end,
}
