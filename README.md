# Neovim Configuration for C++, Python, and Bash Development

A modern Neovim configuration using Lazy package manager with multiple themes, optimized for C++, Python, and Bash development with advanced AI-powered features.

## Features

### 🎨 **Multiple Themes Available**
- **Dracula** (Currently Active) - Popular dark theme with vibrant colors
- **Catppuccin** - Beautiful and modern color scheme
- **Tokyo Night** - Modern dark theme with great contrast
- **Gruvbox** - Classic warm brown theme
- **Kanagawa** - Japanese-inspired chocolate/brown theme
- **Everforest** - Warm chocolate/forest theme
- **OneDark** - VS Code-inspired theme

### 🚀 **Advanced C++ Development**
- **Function Generation** - Auto-generate function definitions from call sites
- **Clangd Extensions** - Enhanced C++ support with inlay hints
- **Smart Code Actions** - Context-aware quick fixes and refactoring
- **Include Management** - Automatic header include suggestions

### 🤖 **AI-Powered Development with GitHub Copilot**
- **Copilot Integration** - AI code completion and suggestions
- **Copilot Chat** - Interactive AI chat with floating window
- **Context-Aware Chat** - Chat about specific files, selections, or workspace
- **File Editing** - AI can directly edit and create files
- **Tab Completion** - Smart suggestion acceptance

### 💾 **Auto-Save System**
- **Smart Auto-Save** - Automatically saves files after changes
- **File Type Aware** - Doesn't interfere with special buffers
- **Configurable Triggers** - Save on insert leave, text change, focus loss

### 🔍 **Enhanced Search and Navigation**
- **Telescope** - Fuzzy finder for files, grep, and more
- **LSP Integration** - Advanced code navigation and search

### 🌳 **Advanced Language Support**
- **C++** - Full LSP support with clangd, debugging, and function generation
- **Python** - Pyright LSP with type checking and completion
- **Bash/Shell** - Bash LSP with shellcheck integration
- **Lua** - Native Neovim Lua support
- **CMake** - CMake language server support

### 🛠️ **Development Tools**
- **Mason** - Automatic LSP, DAP, and tool installation
- **Debugging** - Full debugging support with nvim-dap
- **Git Integration** - Advanced git operations and diff viewing
- **Terminal** - Integrated terminal with toggleterm
- **File Management** - Advanced file explorer with NvimTree

### 🎯 **UI and UX**
- **Noice** - Beautiful command line and UI
- **Lualine** - Customizable status line
- **Bufferline** - Tab bar with buffer management
- **Dashboard** - Beautiful startup screen
- **Notifications** - Elegant notification system
- **Indent Guides** - Visual indentation helpers

## Key Mappings

### Leader Key
- `<Space>` is set as the leader key

### 📁 **File Management & Search**
- `<leader>ff` - Find files with Telescope
- `<leader>fg` - Live grep with Telescope
- `<leader>fb` - Browse buffers with Telescope
- `<leader>fh` - Help tags with Telescope
- `<leader>fH` - Find files from home directory
- `<C-n>` - Toggle NvimTree file explorer
- `<leader>e` - Refresh NvimTree

### 🔍 **LSP Navigation with Telescope**
- `<leader>fr` - Find references with Telescope
- `<leader>fs` - Find document symbols with Telescope
- `<leader>fS` - Find workspace symbols with Telescope
- `<leader>fi` - Find implementations with Telescope
- `<leader>fd` - Find definitions with Telescope
- `<leader>ft` - Find type definitions with Telescope

### 🖥️ **Terminal**
- `<leader>t` - Toggle terminal
- `<Esc>` (in terminal) - Exit terminal mode

### 🚀 **LSP (Language Server Protocol)**
- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Go to references
- `gi` - Go to implementation
- `K` - Hover documentation
- `<leader>rn` - Rename symbol

### ⚡ **Code Actions & Quick Fixes**
- `<leader>ca` - All code actions (shows all available fixes/refactors)
- `<leader>cA` - Range code actions (for selected text)
- `<leader>cf` - Quick fix code actions only
- `<leader>cr` - Refactor code actions only
- `<leader>cs` - Source code actions only

### 🛠️ **C++ Specific Features**
- `<leader>cg` - Generate function definition from call site
- `<leader>cq` - Quick apply function generation (auto-apply)
- `<leader>ch` - C++ specific code actions (headers, generation)
- `<leader>ci` - Add missing includes
- `<leader>f` - Format code (C++ files only)

### 🤖 **GitHub Copilot**
#### Insert Mode (Code Completion):
- `<Tab>` - Accept Copilot suggestion
- `<C-j>` - Next suggestion
- `<C-k>` - Previous suggestion

#### Chat Commands:
- `<leader>bc` - Open Copilot Chat
- `<leader>bt` - Toggle Copilot Chat
- `<leader>bq` - Chat about current buffer
- `<leader>bs` - Quick chat with current buffer
- `<leader>bv` - Chat about visual selection (in visual mode)
- `<leader>bw` - Chat about workspace

#### Code Actions:
- `<leader>be` - Explain selected code (visual mode)
- `<leader>bf` - Fix selected code (visual mode)
- `<leader>bg` - Generate tests for selected code (visual mode)
- `<leader>bd` - Generate documentation
- `<leader>br` - Review current file

#### AI File Editing:
- `<leader>bi` - Inline edit selected code (visual mode)
- `<leader>bn` - Create new file with AI
- `<leader>bm` - Modify current buffer with AI

### 🩺 **Diagnostics**
- `<leader>e` - Show diagnostic details on current line (floating window)
- `gl` - Show diagnostic details (alternative shortcut)
- `<leader>xx` - Show all diagnostics with Telescope
- `<leader>xe` - Show only errors with Telescope
- `<leader>xw` - Show only warnings with Telescope
- `[d` - Go to previous diagnostic
- `]d` - Go to next diagnostic

### 📋 **Buffer Management**
- `<Tab>` - Next buffer
- `<S-Tab>` - Previous buffer

### 📊 **Bufferline (Tab Bar)**
- `<leader>1-9` - Jump to buffer 1-9
- `<leader>0` - Jump to buffer 10
- `<leader>bb` - Pick a buffer to switch to
- `<leader>bx` - Pick a buffer to close
- `<leader>bl` - Close all buffers to the left
- `<leader>bR` - Close all buffers to the right
- `<leader>bo` - Close all other buffers

### 🔲 **Window Navigation**
- `<C-h>` - Navigate to left window
- `<C-j>` - Navigate to down window
- `<C-k>` - Navigate to up window
- `<C-l>` - Navigate to right window

### 🐛 **Debugger**
- `<leader>db` - Toggle breakpoint
- `<leader>dc` - Continue debugging
- `<leader>di` - Step into
- `<leader>do` - Step over
- `<leader>du` - Step out
- `<leader>dr` - Toggle REPL
- `<leader>dl` - Run last configuration
- `<leader>dt` - Terminate debugging
- `<leader>dw` - Show watches
- `<leader>ds` - Show scopes
- `<leader>dh` - Show call stack
- `<leader>dbp` - Show breakpoints

### 🌐 **Git Operations**
- `<leader>gg` - Open Neogit
- `<leader>gc` - Quick commit
- `<leader>gp` - Quick push
- `<leader>gl` - Quick pull
- `<leader>gb` - Branch management
- `<leader>gd` - Open diff view
- `<leader>gD` - Close diff view
- `<leader>gh` - File history

### 🔧 **Configuration & General**
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>d` - Open dashboard
- `<leader>R` - Reload Neovim configuration
- `<leader>rl` - Sync plugins with Lazy

### 🎨 **Formatting**
- `<leader>fm` - Format file
- `<leader>fw` - Format and write

### 💾 **Auto-Save Controls**
- `<leader>as` - Toggle auto-save
- `<leader>ae` - Enable auto-save
- `<leader>ad` - Disable auto-save

## 🚀 Advanced C++ Features

### Function Generation from Call Site
One of the most powerful features is the ability to generate function definitions directly from where you call them:

1. **Write the function call** where you want to use it:
   ```cpp
   int result = calculateSum(10, 20);  // Function doesn't exist yet
   ```

2. **Generate the function** by placing cursor on `calculateSum` and pressing:
   - `<leader>cg` - Shows generation options
   - `<leader>cq` - Quick apply (auto-generates)

3. **Result**: Function declaration and definition are automatically created with proper types inferred from the call site.

### Context-Aware Code Actions
- **Smart Include Management**: `<leader>ci` automatically adds missing headers
- **Type-Aware Generation**: Function parameters and return types are inferred from usage
- **Multiple Generation Options**: Choose between header/source file placement

## 🤖 GitHub Copilot Integration

### AI-Powered Code Completion
- **Smart Suggestions**: Context-aware code completion
- **Tab Acceptance**: Press `<Tab>` to accept suggestions
- **Multi-Suggestion Navigation**: Use `<C-j>`/`<C-k>` to cycle through options

### Interactive AI Chat
- **Floating Window**: Beautiful centered chat interface
- **Context Commands**: Use `@workspace`, `@buffer`, `@selection` for context
- **Slash Commands**: Use `/explain`, `/fix`, `/optimize` for specific actions

### File Context Examples
```vim
" In Copilot Chat, you can use:
@workspace How can I improve error handling in this project?
@buffer Explain this function
@file:main.cpp What does this file do?
/fix Add proper error handling to this code
```

### AI File Editing
The AI can directly modify your files:
- **Select code** → `<leader>bi` → Describe changes → AI edits in place
- **`<leader>bn`** → Create entirely new files with AI assistance
- **`<leader>bm`** → Modify entire files with AI guidance

## Installation

1. **Clone or copy this configuration** to your Neovim config directory:
   ```bash
   # If you want to use this as your main config
   cp -r /path/to/this/config ~/.config/nvim/
   
   # Or if you want to test it first
   mkdir -p ~/.config/nvim_test
   cp -r /path/to/this/config/* ~/.config/nvim_test/
   ```

2. **Install Neovim** (if not already installed):
   ```bash
   # macOS
   brew install neovim
   
   # Ubuntu/Debian
   sudo apt install neovim
   
   # Arch Linux
   sudo pacman -S neovim
   ```

3. **Install required system dependencies**:
   ```bash
   # For C++ development
   # macOS
   brew install llvm
   
   # Ubuntu/Debian
   sudo apt install clang clangd
   
   # For Python development
   pip install pyright
   
   # Optional: For better shell script linting
   # macOS
   brew install shellcheck
   
   # Ubuntu/Debian
   sudo apt install shellcheck
   ```

4. **GitHub Copilot Setup** (Optional but recommended):
   ```bash
   # Make sure you have a GitHub Copilot subscription
   # The plugin will prompt you to authenticate on first use
   # Follow the authentication instructions in Neovim
   ```

4. **Start Neovim**:
   ```bash
   nvim
   ```

5. **Wait for Lazy to install plugins** - The first time you start Neovim, Lazy will automatically install all the required plugins.

## 🌐 Language Support

### 🔧 **C++ (Enhanced)**
- **LSP**: clangd with extended configuration
- **Features**: 
  - Function generation from call sites
  - Advanced code completion with inlay hints
  - Intelligent include management
  - Context-aware refactoring
  - Cross-file navigation and renaming
- **Configuration**: Optimized for modern C++17+ development
- **Extensions**: clangd_extensions.nvim and nvim-treesitter-cpp-tools

### 🏗️ **CMake**
- **LSP**: cmake-language-server (automatically installed via Mason)
- **Features**: CMake syntax highlighting, autocompletion, error checking, go-to-definition
- **Configuration**: Build directory, generator, and parallel jobs settings

### 🐍 **Python**
- **LSP**: Pyright (automatically installed via Mason)
- **Features**: Type checking, code completion, error detection, imports management
- **Configuration**: Optimized type checking for better performance

### 🐚 **Bash/Shell**
- **LSP**: bashls (bash-language-server)
- **Features**: 
  - Shell script autocompletion
  - Syntax checking and error detection
  - Shellcheck integration for best practices
  - Built-in command documentation
- **Supported**: .sh, .bash, .zsh files

### 🌙 **Lua**
- **LSP**: lua_ls (automatically installed via Mason)
- **Features**: Neovim API support, completion, diagnostics
- **Configuration**: Optimized for Neovim configuration development

## Plugin Management

This configuration uses [Lazy.nvim](https://github.com/folke/lazy.nvim) as the package manager. All plugins are defined in `lua/plugins/init.lua`.

### Adding new plugins
To add a new plugin, edit `lua/plugins/init.lua` and add your plugin configuration to the table.

### Updating plugins
```vim
:Lazy sync
```

### Checking plugin status
```vim
:Lazy
```

## Customization

### Theme
The configuration uses the Catppuccin theme with JetBrains Mono Nerd Font. You can change the theme by modifying the theme section in `lua/plugins/theme.lua`.

### Key mappings
All key mappings are defined in `init.lua`. You can modify them according to your preferences.

### LSP settings
LSP configurations for C++ and Python are in `lua/plugins/init.lua`. You can customize them based on your project needs.

## ⚠️ Key Binding Conflicts (Resolved)

Some keybindings had conflicts which have been resolved:

### Resolved Conflicts:
- **`<leader>bc`**: Bufferline close vs Copilot Chat → Changed bufferline to `<leader>bx`
- **`<leader>br`**: Bufferline close right vs Copilot Review → Changed bufferline to `<leader>bR`  
- **`<leader>cf`**: Quick fix vs C++ function generation → Separated (`<leader>cf` = quick fix, `<leader>cq` = quick apply generation)

### Current Keybinding Assignments:
- **`<leader>c*`**: Code actions and C++ features
- **`<leader>b*`**: Bufferline and Copilot Chat
- **`<leader>f*`**: File finding and LSP navigation
- **`<leader>d*`**: Debugging
- **`<leader>g*`**: Git operations

## 🔧 Troubleshooting

### LSP not working
1. **Check Mason installation**:
   ```vim
   :Mason
   ```
   Ensure clangd, pyright, bashls are installed

2. **Check LSP status**:
   ```vim
   :LspInfo
   ```

3. **Restart LSP**:
   ```vim
   :LspRestart
   ```

### C++ Function Generation not working
1. **Ensure clangd is running**: Check `:LspInfo`
2. **Use proper C++ file extension**: .cpp, .cc, .hpp
3. **Try different commands**:
   - `<leader>cg` - Shows all generation options
   - `<leader>cq` - Quick apply generation
   - `<leader>ca` - All available code actions

### Copilot Issues
1. **Authentication**: Follow prompts in Neovim for GitHub authentication
2. **Check status**: `:Copilot status`
3. **Manual setup**: `:Copilot setup`

### Auto-save Problems
1. **Toggle auto-save**: `<leader>as`
2. **Check if enabled**: Look for "Auto-save enabled" notification
3. **File-specific issues**: Some file types are excluded (check `lua/plugins/autosave.lua`)

### Theme/Color Issues
1. **Terminal colors**: Ensure terminal supports true colors
2. **Font issues**: Install JetBrains Mono Nerd Font
3. **Italic data types**: Should be fixed in current Dracula configuration

### Plugin installation issues
```vim
:Lazy clean
:Lazy sync
:Lazy restore
```

### Treesitter highlighting issues
```vim
:TSUpdate
:TSInstall cpp python lua bash
```

## 📋 Requirements

### Essential
- **Neovim 0.9.0 or higher** (for best LSP and inlay hints support)
- **Git** (for plugin management)
- **Terminal with true color support**
- **JetBrains Mono Nerd Font** (for icons and best experience)

### Language Servers (Auto-installed via Mason)
- **C++**: clangd
- **Python**: pyright  
- **Bash**: bashls (bash-language-server)
- **Lua**: lua_ls
- **CMake**: cmake-language-server

### Optional Enhancements
- **Shellcheck** (for better bash linting)
- **GitHub Copilot subscription** (for AI features)
- **Compile commands** (compile_commands.json for better C++ support)

## 🎨 Theme Switching

You can easily switch between themes by editing `lua/plugins/theme.lua`:

1. **Comment out current active theme** (remove `priority = 1000` line)
2. **Uncomment desired theme** (add `priority = 1000` and uncomment colorscheme line)
3. **Reload Neovim** with `<leader>R`

Available themes:
- **Dracula** (currently active)
- **Catppuccin** (mocha, latte, frappe, macchiato)
- **Tokyo Night** (night, storm, moon, day)
- **Gruvbox** (classic warm colors)
- **Kanagawa** (Japanese-inspired)
- **Everforest** (nature-inspired)
- **OneDark** (VS Code style)

## License

This configuration is open source and available under the MIT License. 