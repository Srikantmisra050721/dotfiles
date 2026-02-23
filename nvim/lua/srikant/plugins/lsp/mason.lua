return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		mason_lspconfig.setup({
			ensure_installed = {
				-- Languages
				"clangd", -- C, C++, ASM
				"rust_analyzer", -- Rust
				"pyright", -- Python
				"jdtls", -- Java
				"lua_ls", -- Lua
				"texlab",
				"ltex_plus",
				"ltex",
				"vimls", -- Vim
				-- Web Dev
				"ts_ls", -- Javascript, Typescript, TSX (replaced tsserver)
				"svelte", -- Svelte
				"html", -- HTML
				"cssls", -- CSS
				-- Tools & Docs
				"dockerls", -- Dockerfile
				"bashls", -- Bash
				"texlab", -- LaTeX
				"marksman", -- Markdown
				-- Formatters
				"stylua", -- Lua

				-- Linters
				"ruff", -- Python (Linter + Formatter)
			},
			automatic_enable = true,
		})
		mason_tool_installer.setup({
			ensure_installed = {
				-- Formatters
				"stylua",
				"clang-format",
				"rustfmt",
				"black",
				"isort",
				"google-java-format",
				"prettier",
				"shfmt",
				"latexindent",
				-- Linters
				"ruff",
				"eslint_d",
				"shellcheck",
				"hadolint",
				"markdownlint",
			},
		})
	end,
}
