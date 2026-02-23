return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies ={ 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'},
  opts = {
            },
  config = function()
     require('render-markdown').setup({
      file_types = { 'markdown','vimwiki','tex',},
      render_modes = true,
      anti_conceal = { 
        enabled = true,
        disabled_modes = false,
        above = 0,
        below = 0,
      },
      latex = {
        enabled = true, -- Crucial for math subjects
        converter = 'latex2text', -- Requires pylatexenc
      },
      enabled = true,
    })
  end,
}


