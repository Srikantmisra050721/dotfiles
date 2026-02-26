return {
  {
    'leafOfTree/vim-svelte-plugin',
    ft = "svelte", -- Lazy load on svelte files
    config = function()
      -- Optional Configuration
      vim.g.vim_svelte_plugin_load_full_html = 1
      vim.g.vim_svelte_plugin_use_typescript = 1
      vim.g.vim_svelte_plugin_use_sass = 1
    end
  }
}
