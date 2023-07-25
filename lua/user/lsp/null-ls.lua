local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  vim.notify("null-ls is not found")
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local completion = null_ls.builtins.completion
local hover = null_ls.builtins.hover
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = true,
	sources = {
		-- formatting.rustfmt.with({
		-- 	extra_args = function(params)
		-- 		local Path = require("plenary.path")
		-- 		local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")
		-- 		if cargo_toml:exists() and cargo_toml:is_file() then
		-- 			for _, line in ipairs(cargo_toml:readlines()) do
		-- 				local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
		-- 				if edition then
		-- 					return { "--edition=" .. edition }
		-- 				end
		-- 			end
		-- 		end
		-- 		-- default edition when we don't find `Cargo.toml` or the `edition` in it.
		-- 		return { "--edition=2021" }
		-- 	end,
		-- }),
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),

    -- Python
		formatting.black.with({ extra_args = { "--fast" } }),

    -- Lua
		formatting.stylua,

    -- Markdown
    -- formatting.buf,
    -- formatting.markdownlint,

    -- PG
    -- formatting.pg_format,

		diagnostics.eslint,
		diagnostics.pylint,
    diagnostics.actionlint, -- Github Workflows
    -- diagnostics.alex, -- Markdown, Catch insensitive, inconsiderate writing
    -- diagnostics.buf, -- Protobuf

		-- completion.spell,

    -- Code actions
    -- code_actions.gitsigns,

		-- hover.dictionary,
	},
})
