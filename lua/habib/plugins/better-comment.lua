return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup({
      keywords = {
        TODO = { icon = " ", color = "info", alt = { "todo" } },
        FIX = { icon = " ", color = "error", alt = { "fixme", "bug" } },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "warning", "xxx" } },
        PERF = { icon = " ", color = "hint", alt = { "optimize", "performance" } },
        NOTE = { icon = " ", color = "hint", alt = { "info" } },
      },
    })
  end,
}



