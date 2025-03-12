return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      window = {
        layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.3, -- fractional width of parent, or absolute width in columns when > 1
        title = 'Copilot Chat ksldjfal', -- title of chat window
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
