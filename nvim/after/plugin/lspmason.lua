-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
on_attach = function(current_client, bufnr)
	if current_client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					async = true,
					filter = function(client)
						--  only use null-ls for formatting instead of lsp server
						return client.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end,
		})
	end
end

local servers = {
	tsserver = {},
	html = {},
	cssls = {},
	tailwindcss = {},
	lua_ls = {},
	emmet_ls = {},
}

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = servers,
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = servers,
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
