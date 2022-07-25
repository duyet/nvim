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

	use "wbthomason/packer.nvim"                                    -- Have packer manage itself
	use "nvim-lua/plenary.nvim"                                     -- Useful lua functions used by lots of plugins
	use "windwp/nvim-autopairs"                                     -- Autopairs, integrates with both cmp and treesitter
	use "numToStr/Comment.nvim"
	use "JoosepAlviste/nvim-ts-context-commentstring"
	use "kyazdani42/nvim-web-devicons"
	use "kyazdani42/nvim-tree.lua"
	use "akinsho/bufferline.nvim"
	use "moll/vim-bbye"
	use "nvim-lualine/lualine.nvim"
	use "akinsho/toggleterm.nvim"
	use "ahmedkhalf/project.nvim"
	use "lewis6991/impatient.nvim"
	use "lukas-reineke/indent-blankline.nvim"
	use "goolord/alpha-nvim"
	use "folke/which-key.nvim"
  use "wakatime/vim-wakatime"
  use "ggandor/lightspeed.nvim"

  -- Surround
  use "kylechui/nvim-surround"

  use({'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'})
  use({'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons'})

	-- Colorschemes
	use "folke/tokyonight.nvim"
	use "lunarvim/darkplus.nvim"

	-- cmp plugins
	use "hrsh7th/nvim-cmp"             -- The completion plugin
	use "hrsh7th/cmp-buffer"           -- buffer completions
	use "hrsh7th/cmp-path"             -- path completions
	use "saadparwaiz1/cmp_luasnip"     -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" }) -- for formatters and linters

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" })

	-- Treesitter
	use "nvim-treesitter/nvim-treesitter"

	-- Git
	use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
