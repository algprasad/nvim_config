-- Keymaps
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ============================================================================
-- TELESCOPE (Fuzzy Finder)
-- ============================================================================
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)                    -- Find files
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)                     -- Live grep
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)                       -- Browse buffers
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)                     -- Help tags
keymap("n", "<leader>fH", "<cmd>Telescope find_files cwd=~<cr>", opts)              -- Find files from home
keymap("n", "<leader>xx", "<cmd>Telescope diagnostics<cr>", opts)                   -- All diagnostics
keymap("n", "<leader>xe", "<cmd>Telescope diagnostics severity=ERROR<cr>", opts)    -- Error diagnostics
keymap("n", "<leader>xw", "<cmd>Telescope diagnostics severity=WARN<cr>", opts)     -- Warning diagnostics

-- LSP Telescope
keymap("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", opts)                -- Find references
keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", opts)          -- Document symbols
keymap("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", opts)         -- Workspace symbols
keymap("n", "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", opts)           -- Implementations
keymap("n", "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", opts)               -- Definitions
keymap("n", "<leader>ft", "<cmd>Telescope lsp_type_definitions<cr>", opts)          -- Type definitions

-- ============================================================================
-- FILE EXPLORER
-- ============================================================================
keymap("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", opts)                               -- Toggle file explorer
keymap("n", "<leader>e", "<cmd>NvimTreeRefresh<cr>", opts)                          -- Refresh file explorer

-- ============================================================================
-- TERMINAL
-- ============================================================================
keymap("n", "<leader>t", "<cmd>ToggleTerm<cr>", opts)                               -- Toggle terminal
keymap("t", "<esc>", "<cmd>stopinsert<cr>", opts)                              -- Switch to normal mode

-- ============================================================================
-- LSP (Language Server Protocol)
-- ============================================================================
keymap("n", "gd", vim.lsp.buf.definition, opts)                                     -- Go to definition
keymap("n", "gr", vim.lsp.buf.references, opts)                                     -- Go to references
keymap("n", "K", vim.lsp.buf.hover, opts)                                           -- Hover documentation
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)                                 -- Rename symbol

-- Diagnostics
keymap("n", "[d", vim.diagnostic.goto_prev, opts)                                   -- Previous diagnostic
keymap("n", "]d", vim.diagnostic.goto_next, opts)                                   -- Next diagnostic
keymap("n", "<leader>xx", vim.diagnostic.open_float, opts)                          -- Show diagnostic
keymap("n", "<leader>xl", vim.diagnostic.setloclist, opts)                          -- Location list

-- Code Actions
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'quickfix' } }})<cr>", opts)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'refactor' } }})<cr>", opts)
keymap("n", "<leader>cs", "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source' } }})<cr>", opts)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)            -- All code actions
keymap("n", "<leader>cA", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", opts)      -- Range code actions

-- ============================================================================
-- BUFFER MANAGEMENT
-- ============================================================================
keymap("n", "<leader>bn", "<cmd>bnext<cr>", opts)                                   -- Next buffer
keymap("n", "<leader>bp", "<cmd>bprevious<cr>", opts)                               -- Previous buffer
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", opts)                                 -- Delete buffer
keymap("n", "<Tab>", "<cmd>bnext<cr>", opts)                                        -- Next buffer (Tab)
keymap("n", "<S-Tab>", "<cmd>bprevious<cr>", opts)                                  -- Previous buffer (Shift+Tab)

-- ============================================================================
-- WINDOW NAVIGATION
-- ============================================================================
keymap("n", "<C-h>", "<C-w>h", opts)                                                -- Navigate left
keymap("n", "<C-j>", "<C-w>j", opts)                                                -- Navigate down
keymap("n", "<C-k>", "<C-w>k", opts)                                                -- Navigate up
keymap("n", "<C-l>", "<C-w>l", opts)                                                -- Navigate right

-- ============================================================================
-- FILE OPERATIONS
-- ============================================================================
keymap("n", "<leader>w", "<cmd>w<cr>", opts)                                        -- Save file
keymap("n", "<leader>q", "<cmd>q<cr>", opts)                                        -- Quit

-- ============================================================================
-- DASHBOARD
-- ============================================================================
keymap("n", "<leader>d", "<cmd>Alpha<cr>", opts)                                    -- Open dashboard

-- ============================================================================
-- GIT OPERATIONS
-- ============================================================================
keymap("n", "<leader>gg", "<cmd>Neogit<cr>", opts)                                  -- Open Neogit
keymap("n", "<leader>gc", "<cmd>Neogit commit<cr>", opts)                           -- Quick commit
keymap("n", "<leader>gp", "<cmd>Neogit push<cr>", opts)                             -- Quick push
keymap("n", "<leader>gl", "<cmd>Neogit pull<cr>", opts)                             -- Quick pull
keymap("n", "<leader>gb", "<cmd>Neogit branch<cr>", opts)                           -- Branch management
keymap("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", opts)                            -- Open diff view
keymap("n", "<leader>gD", "<cmd>DiffviewClose<cr>", opts)                           -- Close diff view
keymap("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", opts)                     -- File history

-- ============================================================================
-- DIRECTORY NAVIGATION
-- ============================================================================
keymap("n", "<leader>cd", "<cmd>cd %:p:h<cr>", opts)                                -- Change to file directory
keymap("n", "<leader>lcd", "<cmd>lcd %:p:h<cr>", opts)                              -- Change local directory

-- ============================================================================
-- CONFIGURATION
-- ============================================================================
keymap("n", "<leader>R", "<cmd>source ~/.config/nvim/init.lua<cr>", opts)           -- Reload config
keymap("n", "<leader>rl", "<cmd>Lazy sync<cr>", opts)                               -- Sync plugins

-- ============================================================================
-- RUN CONFIGURATIONS
-- ============================================================================
keymap("n", "<leader>lr", "<cmd>lua require('run_config').show_configs()<cr>", opts) -- Show run configs
keymap("n", "<leader>lt", "<cmd>lua require('run_config').create_template()<cr>", opts) -- Create template

-- ============================================================================
-- FORMATTING
-- ============================================================================
keymap("n", "<leader>fm", "<cmd>Format<cr>", opts)                                  -- Format file
keymap("n", "<leader>fw", "<cmd>FormatWrite<cr>", opts)                             -- Format and write

-- ============================================================================
-- DEBUGGER
-- ============================================================================
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)    -- Toggle breakpoint
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)             -- Continue debugging
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)            -- Step into
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)            -- Step over
keymap("n", "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", opts)             -- Step out
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)          -- Toggle REPL
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)             -- Run last config
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)            -- Terminate debugging
keymap("n", "<leader>dw", "<cmd>lua require'dapui'.float_element('watches')<cr>", opts) -- Show watches
keymap("n", "<leader>ds", "<cmd>lua require'dapui'.float_element('scopes')<cr>", opts)   -- Show scopes
keymap("n", "<leader>dh", "<cmd>lua require'dapui'.float_element('stacks')<cr>", opts)   -- Show call stack
keymap("n", "<leader>dbp", "<cmd>lua require'dapui'.float_element('breakpoints')<cr>", opts) -- Show breakpoints

-- ============================================================================
-- BUFFERLINE (TAB BAR)
-- ============================================================================
-- Quick buffer navigation (1-9)
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

-- Buffer management
keymap("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", opts)                     -- Pick buffer to close
keymap("n", "<leader>bb", "<cmd>BufferLinePick<cr>", opts)                          -- Pick buffer to switch
keymap("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", opts)                     -- Close buffers to left
keymap("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", opts)                    -- Close buffers to right
keymap("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", opts)                   -- Close other buffers

-- ============================================================================
-- COPILOT
-- ============================================================================
-- Copilot suggestions
keymap("i", "<C-j>", "<Plug>(copilot-next)", { silent = true })                    -- Accept next suggestion
keymap("i", "<C-k>", "<Plug>(copilot-previous)", { silent = true })                 -- Accept previous suggestion
keymap("i", "<C-l>", "<Plug>(copilot-suggest)", { silent = true })                  -- Trigger suggestion

-- Copilot Chat
keymap("n", "<leader>bc", "<cmd>CopilotChat<cr>", opts)                             -- Open Copilot Chat
keymap("n", "<leader>bt", "<cmd>CopilotChatToggle<cr>", opts)                       -- Toggle Copilot Chat
keymap("v", "<leader>be", "<cmd>CopilotChatExplain<cr>", opts)                      -- Explain selected code
keymap("v", "<leader>bf", "<cmd>CopilotChatFix<cr>", opts)                          -- Fix selected code
keymap("v", "<leader>bg", "<cmd>CopilotChatTests<cr>", opts)                        -- Generate tests for selected code
keymap("n", "<leader>bd", "<cmd>CopilotChatDocs<cr>", opts)                         -- Generate documentation
keymap("v", "<leader>br", "<cmd>CopilotChatReview<cr>", opts)                       -- Review current file 
