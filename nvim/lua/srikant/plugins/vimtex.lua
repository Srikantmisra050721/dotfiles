return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "zathura"
		-- Or for Mac: vim.g.vimtex_view_method = "skim"

		-- This enables "Continuous Compilation"
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk = { build_dir = "build" }
	end,
}
