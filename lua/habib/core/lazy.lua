
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local installed, lazy = pcall(require, "lazy")
if not installed then
  return
end

lazy.setup({
  spec = {
    { import = "habib.plugins" },
    { import = "habib.plugins.lang" },
    { import = "habib.plugins.lang/flutter" },
    { import = "habib.plugins.lang.php" },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      opts = {
        flavour = "latte",
        transparent_background = true,
        term_colors = true,
      },
    },
  },
  ui = { border = "double", size = { width = 0.8, height = 0.8 } },
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },

  -- flutter snipets
  { "rafamadriz/friendly-snippets" },
})
