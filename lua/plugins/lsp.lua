return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"mfussenegger/nvim-lint",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("lint").linters_by_ft = {
			python = { "pylint" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})

		-- Show linters for the current buffer's file type
		vim.api.nvim_create_user_command("LintInfo", function()
			local filetype = vim.bo.filetype
			local linters = require("lint").linters_by_ft[filetype]

			if linters then
				print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
			else
				print("No linters configured for filetype: " .. filetype)
			end
		end, {})

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"dockerls",
				"lua_ls",
				"pyright",
				"yamlls",
				"html",
				"cssls",
				"tsserver",
			},
		})

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,

			-- Custom settings for specific servers
			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				})
			end,

			["html"] = function()
				require("lspconfig").html.setup({
					capabilities = capabilities,
					filetypes = { "html", "htmldjango" },
				})
			end,
		})
	end,
}
