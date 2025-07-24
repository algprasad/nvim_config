-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set font for GUI Neovim
vim.opt.guifont = "JetBrainsMono Nerd Font:h12"

-- Set font for terminal Neovim (if supported)
vim.opt.guifontwide = "JetBrainsMono Nerd Font:h12"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
  { import = "plugins.theme" },
  { import = "plugins.essentials" },
  { import = "plugins.dashboard" },
  { import = "plugins.noice" },
  { import = "plugins.telescope" },
  { import = "plugins.treesitter" },
  { import = "plugins.nvimtree" },
  { import = "plugins.toggleterm" },
  { import = "plugins.lsp" },
  { import = "plugins.git" },
  { import = "plugins.comment" },
  { import = "plugins.autopairs" },
  { import = "plugins.indent" },
  { import = "plugins.lualine" },
  { import = "plugins.notify" },
  { import = "plugins.debugger" },
  { import = "plugins.bufferline" },
  { import = "plugins.formatter" },
})

-- Load keymaps
require("mappings")

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.completeopt = "menu,menuone,noselect"

-- Auto-format JSON files on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.json",
  callback = function()
    vim.cmd("FormatWrite")
  end,
})
