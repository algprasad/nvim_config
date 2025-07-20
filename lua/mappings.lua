-- Keymaps
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fd", "<cmd>Telescope find_files cwd=~<cr>", opts)
keymap("n", "<leader>xx", "<cmd>Telescope diagnostics<cr>", opts)
keymap("n", "<leader>xe", "<cmd>Telescope diagnostics severity=ERROR<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Telescope diagnostics severity=WARN<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", opts)
keymap("n", "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<cr>", opts)
keymap("n", "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", opts)
keymap("n", "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", opts)
keymap("n", "<leader>ft", "<cmd>Telescope lsp_type_definitions<cr>", opts)

-- NvimTree
keymap("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<leader>r", "<cmd>NvimTreeRefresh<cr>", opts)

-- ToggleTerm
keymap("n", "<leader>t", "<cmd>ToggleTerm<cr>", opts)
keymap("t", "<esc>", "<cmd>ToggleTerm<cr>", opts)

-- LSP
keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", "gr", vim.lsp.buf.references, opts)
keymap("n", "K", vim.lsp.buf.hover, opts)
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_next, opts)
keymap("n", "<leader>e", vim.diagnostic.open_float, opts)
keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'quickfix' } }})<cr>", opts)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'refactor' } }})<cr>", opts)
keymap("n", "<leader>cs", "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source' } }})<cr>", opts)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<leader>cA", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", opts)

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

-- Directory navigation
keymap("n", "<leader>cd", "<cmd>cd %:p:h<cr>", opts)
keymap("n", "<leader>lcd", "<cmd>lcd %:p:h<cr>", opts)

-- Debugger
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<leader>dw", "<cmd>lua require'dapui'.float_element('watches')<cr>", opts)
keymap("n", "<leader>ds", "<cmd>lua require'dapui'.float_element('scopes')<cr>", opts)
keymap("n", "<leader>dh", "<cmd>lua require'dapui'.float_element('stacks')<cr>", opts)
keymap("n", "<leader>dbp", "<cmd>lua require'dapui'.float_element('breakpoints')<cr>", opts)

-- Bufferline
keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", opts)
keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", opts)
keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", opts)
keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", opts)
keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", opts)
keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", opts)
keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", opts)
keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", opts)
keymap("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", opts)
keymap("n", "<leader>0", "<cmd>BufferLineGoToBuffer 10<cr>", opts)
keymap("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", opts)
keymap("n", "<leader>bp", "<cmd>BufferLinePick<cr>", opts)
keymap("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", opts)
keymap("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", opts)
keymap("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", opts) 