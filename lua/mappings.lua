-- Keymaps
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

-- NvimTree
keymap("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", opts)

-- ToggleTerm
keymap("n", "<leader>t", "<cmd>ToggleTerm<cr>", opts)
keymap("t", "<esc>", "<cmd>ToggleTerm<cr>", opts)

-- LSP
keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", "gr", vim.lsp.buf.references, opts)
keymap("n", "K", vim.lsp.buf.hover, opts)
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

-- Buffer navigation
keymap("n", "<leader>bn", "<cmd>bnext<cr>", opts)
keymap("n", "<leader>bp", "<cmd>bprevious<cr>", opts)
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", opts)
keymap("n", "<Tab>", "<cmd>bnext<cr>", opts)
keymap("n", "<S-Tab>", "<cmd>bprevious<cr>", opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Save and quit
keymap("n", "<leader>w", "<cmd>w<cr>", opts)
keymap("n", "<leader>q", "<cmd>q<cr>", opts)

-- Dashboard
keymap("n", "<leader>d", "<cmd>Alpha<cr>", opts) 