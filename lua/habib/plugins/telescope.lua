return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kdheepak/lazygit.nvim",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          layout_config = {
            width = 0.80,
            prompt_position = "bottom",
            preview_cutoff = 120,
            horizontal = { mirror = false },
            vertical = { mirror = false },
          },
          find_command = {
            "rg",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          prompt_prefix = "  ",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          layout_strategy = "horizontal",
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = {},
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = {},
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          use_less = true,
          set_env = { ["COLORTERM"] = "truecolor" },
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            i = {
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<esc>"] = actions.close,
              ["<CR>"] = actions.select_default + actions.center,
            },
            n = {
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
          },
        },
      })

      telescope.load_extension("fzf")

      -- Añadir configuraciones de transparencia
      vim.cmd([[hi TelescopeNormal guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi TelescopeBorder guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi TelescopePromptNormal guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi TelescopePromptBorder guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi TelescopeResultsNormal guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi TelescopeResultsBorder guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi TelescopePreviewNormal guibg=NONE ctermbg=NONE]])
      vim.cmd([[hi TelescopePreviewBorder guibg=NONE ctermbg=NONE]])
    end,
  },

  -- telescope ui select extensions
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
            }),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}

