return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local lualine = require("lualine")

  local default_theme = { fg = "#FFFFFF", bg = "None" }
  lualine.setup({
options = {
    theme = {
        normal = {
            c = default_theme,
            x = default_theme,
            -- ... and all the sections you use
        },
        inactive = {
            c = default_theme,
            x = default_theme,
            -- ... and all the sections you use
        },
    },
    globalstatus = true,  -- Add this line
},
  })
  end,
}
