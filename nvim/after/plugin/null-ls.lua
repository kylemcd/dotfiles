-- import none-ls plugin safely (maintained fork of null-ls)
-- Note: none-ls still uses "null-ls" as the module name for compatibility
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- Format on save configuration
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					filter = function(client)
						return client.name == "null-ls"
					end,
				})
			end,
		})
	end
	
	-- Create user command for manual formatting
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format({
			bufnr = bufnr,
			filter = function(client)
				return client.name == "null-ls"
			end,
		})
		print("File formatted")
	end, { desc = "Format current buffer with LSP" })
end

-- configure null_ls (using none-ls plugin)
null_ls.setup({
	-- setup formatters & linters
	sources = {
		-- JavaScript/TypeScript formatter
		formatting.prettier.with({
			prefer_local = "node_modules/.bin",
			filetypes = {
				"javascript",
				"javascriptreact", 
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"graphql",
			},
		}),
		
		-- Lua formatter
		formatting.stylua,
	},
	
	-- Enable format on save
	on_attach = on_attach,
	
	-- Optional: Debug mode
	debug = false,
})