-- Add this to your plugin specs (e.g., lua/plugins/docker.lua)
return {
  "mgierada/lazydocker.nvim",
  dependencies = { "akinsho/toggleterm.nvim" },
  event = "VeryLazy", -- Loads the plugin on startup
  config = function()
    require("lazydocker").setup({
      border = "curved", -- "single" | "double" | "shadow" | "curved"
      width = 0.9,       -- percentage of screen (0-1)
      height = 0.9,
    })
  end,
 }

