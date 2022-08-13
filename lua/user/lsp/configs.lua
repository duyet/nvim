local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup()

local status_ok, lsp_installer = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

-- https://github.com/williamboman/mason-lspconfig.nvim
local servers = { "rust_analyzer", "jsonls", "pylsp", "yamlls", "tsserver", "eslint", "taplo" }

lsp_installer.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	-- Custom opts from ./lsp/settings/<server>.lua
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end

	lspconfig[server].setup(opts)
end
