return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
  },
  config = function()
    require("flutter-tools").setup({
      ui = {
        border = "rounded",
        notification_style = 'native'
      },
      decorations = {
        statusline = {
          app_version = false,
          device = true,
          project_config = false,
        }
      },
      debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
        register_configurations = function(_)
          require("dap").configurations.dart = {}
          require("dap.ext.vscode").load_launchjs()
        end,
      },
      flutter_path = nil,
      flutter_lookup_cmd = nil,
      fvm = false,
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "Comment",
        prefix = "// ",
        enabled = true
      },
      dev_log = {
        enabled = true,
        notify_errors = false,
        open_cmd = "tabedit",
      },
      lsp = {
        color = {
          enabled = true,
          background = false,
          foreground = false,
          virtual_text = true,
          virtual_text_str = "■",
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          analysisExcludedFolders = {},
          renameFilesWithClasses = "prompt",
          enableSnippets = true,
          updateImportsOnRename = true,
        }
      }
    })

    -- Keymaps que se cargan cuando abres un archivo Dart
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "dart",
      callback = function()
        local opts = { noremap = true, silent = true, buffer = true }
        
        -- Comandos principales de Flutter
        vim.keymap.set('n', '<leader>fr', '<cmd>FlutterRun<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Run' }))
        vim.keymap.set('n', '<leader>fq', '<cmd>FlutterQuit<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Quit' }))
        vim.keymap.set('n', '<leader>fR', '<cmd>FlutterRestart<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Restart' }))
        vim.keymap.set('n', '<leader>fD', '<cmd>FlutterDevices<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Devices' }))
        vim.keymap.set('n', '<leader>fe', '<cmd>FlutterEmulators<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Emulators' }))
        
        -- Hot Reload & Hot Restart
        vim.keymap.set('n', '<leader>fh', '<cmd>FlutterReload<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Hot Reload' }))
        vim.keymap.set('n', '<leader>fH', '<cmd>FlutterRestart<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Hot Restart' }))
        
        -- Outline y detalles
        vim.keymap.set('n', '<leader>fo', '<cmd>FlutterOutlineToggle<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Outline Toggle' }))
        vim.keymap.set('n', '<leader>fO', '<cmd>FlutterOutlineOpen<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Outline Open' }))
        
        -- DevTools y logs
        vim.keymap.set('n', '<leader>fd', '<cmd>FlutterDevTools<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter DevTools' }))
        vim.keymap.set('n', '<leader>fda', '<cmd>FlutterDevToolsActivate<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter DevTools Activate' }))
        vim.keymap.set('n', '<leader>fl', '<cmd>FlutterLogClear<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Log Clear' }))
        
        -- Copiar información
        vim.keymap.set('n', '<leader>fy', '<cmd>FlutterCopyProfilerUrl<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Copy Profiler URL' }))
        
        -- Pub commands
        vim.keymap.set('n', '<leader>fp', '<cmd>FlutterPubGet<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Pub Get' }))
        vim.keymap.set('n', '<leader>fP', '<cmd>FlutterPubUpgrade<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Pub Upgrade' }))
        
        -- Rename y refactoring
        vim.keymap.set('n', '<leader>fn', '<cmd>FlutterRename<cr>', vim.tbl_extend('force', opts, { desc = 'Flutter Rename' }))
        
        -- LSP shortcuts específicos de Flutter
        vim.keymap.set('n', '<leader>fa', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code Actions' }))
        vim.keymap.set('v', '<leader>fa', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code Actions' }))
      end,
    })
  end
}
