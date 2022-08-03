local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- <C> = Control
-- <S> = Shift
-- <A> = Alt / Option in Mac

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<Tab>", ":bNext<CR>", opts) -- <Tab> to go to next buffers
keymap("n", "<S-Tab>", ":bprevious<CR>", opts) -- <Shift><Tab> to go to prev buffers

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Jump to far left or right of line
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)

-- Navigate splits
keymap("n", "<A-Up>", "<C-k>", opts)
keymap("n", "<A-Down>", "<C-j>", opts)
keymap("n", "<A-Left>", "<C-h>", opts)
keymap("n", "<A-Right>", "<C-l>", opts)

-- NvimTree
keymap("n", "e", ":NvimTreeFocus<CR>", opts) -- Press "e" to focus to NVimTree, press "e" again to toggle

-- Clear highlight search
keymap("n", "<ESC>", ":nohl<CR>", opts)

-- Search Text, <Space>st
keymap(
	"n",
	"<leader>st",
	":lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({}))<cr>",
	opts
)

-- Format code
-- keymap("n", "<leader>fm", ":lua vim.lsp.buf.formatting_sync()", opts)
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Pasting without yanking
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Format code
keymap("x", "<leader>fm", ":lua vim.lsp.buf.range_formatting()", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
