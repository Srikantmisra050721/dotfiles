return {
	"Avi-D-coder/whisper.nvim",
	cmd = { "WhisperToggle", "WhisperDownloadModel" },
	keys = {
		{ "<C-g>", mode = { "n", "i", "v" }, desc = "Toggle Voice-to-Text" },
	},
	config = function()
		require("whisper").setup({
			model = "base.en", -- Good balance of speed/accuracy for coding
			-- The plugin looks here for models by default on Linux
			model_path = vim.fn.expand("~/.local/share/nvim/whisper/models/"),

			-- Responsive mode: processes audio in chunks so it appears faster
			step_ms = 5000,
			length_ms = 8000,

			keybind = "<C-g>",
			manual_trigger_key = "<Space>", -- Press Space while recording to "dump" text
		})
	end,
}
