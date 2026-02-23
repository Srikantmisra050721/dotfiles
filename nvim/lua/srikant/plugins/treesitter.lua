return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {"windwp/nvim-ts-autotag",'nvim-lua/plenary.nvim'},
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.config")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "c","cpp","asm","rust","python","java", --languages
        "lua","vim","vimdoc","query","markdown","markdown_inline",-- vim and doc 
        "javascript","typescript","tsx","svelte","html","css", --webdev
        "json","dockerfile","gitignore","query","bash","latex",--tools
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
    -- use bash parser for zsh files
    vim.treesitter.language.register("bash", "zsh")
    -- Add this inside your Treesitter config function
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
     
