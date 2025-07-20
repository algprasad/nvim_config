# Neovim Configuration for C++ and Python Development

A modern Neovim configuration using Lazy package manager with Catppuccin theme, optimized for C++ and Python development.

## Features

- 🎨 **Catppuccin Theme** - Beautiful and modern color scheme
- 🔍 **Telescope** - Fuzzy finder for files, grep, and more
- 🌳 **Treesitter** - Advanced syntax highlighting and code parsing
- 📁 **NvimTree** - File explorer
- 🖥️ **ToggleTerm** - Integrated terminal
- 🚀 **LSP Support** - Language Server Protocol for C++ and Python
- ⌨️ **Completion** - Auto-completion with nvim-cmp
- 📝 **Snippets** - Code snippets support
- 🔧 **Mason** - LSP, DAP, and linter installer
- 📊 **Lualine** - Status line
- 💬 **Comment** - Easy commenting
- 🔗 **Auto-pairs** - Automatic bracket pairing
- 📏 **Indent guides** - Visual indent guides
- 🐙 **Git integration** - Git signs and status
- 🎯 **Noice** - Beautiful command line and UI
- 🔔 **Notifications** - Beautiful notification system
- 🏠 **Dashboard** - Beautiful startup screen with quick actions

## Key Mappings

### Leader Key
- `<Space>` is set as the leader key

### File Management
- `<leader>ff` - Find files with Telescope
- `<leader>fg` - Live grep with Telescope
- `<leader>fb` - Browse buffers with Telescope
- `<leader>fd` - Find files from home directory
- `<C-n>` - Toggle NvimTree file explorer
- `<leader>r` - Refresh NvimTree

### Terminal
- `<leader>t` - Toggle terminal
- `<C-\>` - Alternative terminal toggle
- `<Esc>` - Exit terminal mode

### LSP (Language Server Protocol)
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

### Buffer Management
- `<leader>bn` - Next buffer
- `<leader>bp` - Previous buffer
- `<leader>bd` - Delete buffer
- `<Tab>` - Next buffer
- `<S-Tab>` - Previous buffer

### Window Navigation
- `<C-h/j/k/l>` - Navigate between windows

### General
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>d` - Open dashboard
- `<leader>cd` - Change to current file's directory
- `<leader>lcd` - Change local directory to current file's directory

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
   ```

4. **Start Neovim**:
   ```bash
   nvim
   ```

5. **Wait for Lazy to install plugins** - The first time you start Neovim, Lazy will automatically install all the required plugins.

## Language Support

### C++
- **LSP**: clangd (automatically installed via Mason)
- **Features**: Code completion, error checking, refactoring, go-to-definition
- **Configuration**: Optimized for modern C++ development

### CMake
- **LSP**: cmake-language-server (automatically installed via Mason)
- **Features**: CMake syntax highlighting, autocompletion, error checking, go-to-definition
- **Configuration**: Build directory, generator, and parallel jobs settings

### Python
- **LSP**: Pyright (automatically installed via Mason)
- **Features**: Type checking, code completion, error detection
- **Configuration**: Basic type checking mode for better performance

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
The configuration uses the Catppuccin theme. You can change the theme by modifying the theme section in `lua/plugins/init.lua`.

### Key mappings
All key mappings are defined in `init.lua`. You can modify them according to your preferences.

### LSP settings
LSP configurations for C++ and Python are in `lua/plugins/init.lua`. You can customize them based on your project needs.

## Troubleshooting

### LSP not working
1. Make sure you have the required language servers installed:
   - For C++: `clangd`
   - For Python: `pyright`

2. Check if Mason installed the LSP servers:
   ```vim
   :Mason
   ```

3. Restart Neovim after installing language servers.

### Treesitter highlighting issues
Run the following command to update Treesitter parsers:
```vim
:TSUpdate
```

### Plugin installation issues
If plugins fail to install, try:
```vim
:Lazy clean
:Lazy sync
```

## Requirements

- Neovim 0.8.0 or higher
- Git
- A terminal with true color support
- For C++: clangd
- For Python: pyright

## License

This configuration is open source and available under the MIT License. 