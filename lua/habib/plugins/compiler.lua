return {
  { -- Plugin compiler.nvim
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = {
      "stevearc/overseer.nvim",
      "nvim-telescope/telescope.nvim" -- Necesario para búsqueda y más
    },
    opts = {}, -- Aquí puedes pasar configuraciones específicas para compiler.nvim si lo necesitas
  },

  { -- Plugin overseer.nvim, el task runner
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd", -- Fijamos a un commit específico
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" }, -- Estos comandos invocan overseer.nvim también
    opts = {
      task_list = {
        direction = "bottom", -- Mostrar lista de tareas en la parte inferior
        min_height = 15, -- Altura mínima
        max_height = 20, -- Altura máxima
        default_detail = 1, -- Nivel de detalle por defecto
      },
    },
  },
}
