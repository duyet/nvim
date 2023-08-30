local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("packer is not found")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Default
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("nvim-tree/nvim-web-devicons")
	use({ "nvim-tree/nvim-tree.lua", commit = "0a54dcb76b02f3a4e2da370c7a3f6f2b7b43ef01" })
	use({ "akinsho/bufferline.nvim", commit = "b1a63fea34e630f73e84dff21d3c4b0097f6afd4" })
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")
	use("wakatime/vim-wakatime")
	use("ggandor/lightspeed.nvim")

	-- Copilot
	use("github/copilot.vim")

	-- Surround
	use("kylechui/nvim-surround")

	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })

	-- Colorschemes
	-- Please set Colorschemes in colorscheme.lua
	--[[ use("folke/tokyonight.nvim") ]]
	use({ "EdenEast/nightfox.nvim", tag = "v1.0.0" })
	use({"rebelot/kanagawa.nvim", commit = "5f1203f4606e3208f6dd156c03f498d9fadcf1a8"})
	--[[ use({ "lunarvim/darkplus.nvim", commit = "93fb1fd7b2635192d909e11a77256d5822aed5c8" }) ]]
	use({
		"mvllow/modes.nvim",
		tag = "v0.2.0",
		config = function()
			require("modes").setup()
		end,
	})

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-cmdline")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig") -- enable LSP
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("lukas-reineke/lsp-format.nvim")

	-- Rust
	--[[ use("simrat39/rust-tools.nvim") ]]

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", tag="0.1.0" })
	use({ "nvim-treesitter/nvim-treesitter", tag="v0.9.1" })

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use({
		"gen740/SmoothCursor.nvim",
		config = function()
			require("smoothcursor").setup({
				fancy = {
					enable = true,
				},
			})
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
