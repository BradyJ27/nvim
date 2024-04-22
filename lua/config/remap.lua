vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Trouble Keymaps
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- Telescope Keymaps
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
local builtin = require "telescope.builtin"
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })

--vim.keymap.set('n', '<leader>mp', vim.cmd("MarkdownPreview"), { desc = '[M]arkdown [P]review' })

-- Lsp Related Keymaps
vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "gI", builtin.lsp_implementations, { desc = "[G]oto [I]mplementations" })
vim.keymap.set("n", "<leader>D", builtin.lsp_type_definitions, { desc = "Type [D]efinition" })
vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
