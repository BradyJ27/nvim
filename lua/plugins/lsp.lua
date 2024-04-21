return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
		"rcarriga/nvim-dap-ui",	
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-lint",
		"mhartington/formatter.nvim",
	},

	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"bashls",
				"black",
				"dockerls",
				"markdownlint",
				"pyright",
				"yamlls",
			}
		})
		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})
	end
}
