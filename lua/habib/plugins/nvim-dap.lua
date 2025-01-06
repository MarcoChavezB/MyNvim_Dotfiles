
return {
  {
    "mfussenegger/nvim-dap",
    opts = function(_, opts)
      local dap = require("dap")
      dap.adapters.java = {
        type = "executable",
        command = "java",
        args = { "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005" },
      }
      dap.configurations.kotlin = {
        {
          type = "java",
          request = "attach",
          name = "Debug Kotlin",
          hostName = "127.0.0.1",
          port = 5005,
        },
      }
    end,
  },
}
