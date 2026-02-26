return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "zathura"
		-- Or for Mac: vim.g.vimtex_view_method = "skim"

		-- This enables "Continuous Compilation"
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk = {
			out_dir = "build",
			aux_dir = "/home/oscar/.texfiles/",
			out_dir = "/home/oscar/.texfiles/",
		}
	end,
}
