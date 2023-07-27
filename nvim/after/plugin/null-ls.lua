local h = require("null-ls.helpers")
local u = require("null-ls.utils")

-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters

local eslint_d_diagnostics = require("null-ls").builtins.diagnostics.eslint.with({
	cwd = h.cache.by_bufnr(function(params)
		return u.root_pattern(
			".eslintrc",
			".eslintrc.js",
			".eslintrc.cjs",
			".eslintrc.yaml",
			".eslintrc.yml",
			".eslintrc.json"
		)(params.bufname)
	end),
})

-- to setup format on save
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- local on_attach = function(_, bufnr)
-- 	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
-- 		vim.lsp.buf.format({
-- 			bufnr = bufnr,
-- 			filter = function(client)
-- 				return client.name == "null-ls"
-- 			end,
-- 		})
-- 		print("File formatted")
-- 	end, { desc = "Format current buffer with LSP" })
-- end

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		--  to disable file types use
		--  "formatting.prettier.with({disabled_filetypes = {}})" (see null-ls docs)
		formatting.prettier, -- js/ts formatter
		formatting.eslint, -- eslint formatter
		formatting.stylua, -- lua formatter
		eslint_d_diagnostics, -- eslint_d linter
	},
})
