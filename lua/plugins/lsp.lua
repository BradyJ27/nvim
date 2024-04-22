return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup {
			ensure_installed = { "lua_ls", "pyright" },
		}
		require("lspconfig").lua_ls.setup {}
	end
}
