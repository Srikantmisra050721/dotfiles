return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["ltex_plus"] = function()
				lspconfig["ltex_plus"].setup({
					capabilities = capabilities,
					filetypes = { "tex", "bib", "markdown" },
					settings = {
						ltex = { -- Note: this key remains 'ltex' even for ltex_plus
							language = "en-US",
							enabled = { "latex", "tex", "bib", "markdown" }, -- Explicitly enable for these types
							sentenceCacheSize = 2000,
						},
					},
				})
			end,
			-- Harper LS configuration for markdown and LaTeX
			["harper_ls"] = function()
				require("lspconfig")["harper_ls"].setup({
					capabilities = capabilities,
					-- Explicitly add "tex" to the default list (markdown, gitcommit, etc.)
					filetypes = { "markdown", "tex", "gitcommit", "text" },
					settings = {
						["harper-ls"] = {
							userDictPath = "~/harper_dict.txt",
							diagnosticSeverity = "hint",
						},
					},
				})
			end,
		})
	end,
}
