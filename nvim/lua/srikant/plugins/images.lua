return {
	"3rd/image.nvim",
	dependencies = { "vhyrro/luarocks.nvim" },
	opts = {
		backend = "kitty", -- or "ueberzug" if not on Kitty/WezTerm
		max_height_window_percentage = 50,
		hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- Auto-open these files
	},
}
