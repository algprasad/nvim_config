return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header with NEOVIM ASCII art
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
      "                 [ ALG Configuration ]                ",
      "                                                     ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "📁  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "🔍  Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "📂  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", "🔎  Live grep", ":Telescope live_grep <CR>"),
      dashboard.button("t", "🖥️  Terminal", ":ToggleTerm <CR>"),
      dashboard.button("n", "🌳  File explorer", ":NvimTreeToggle <CR>"),
      dashboard.button("c", "⚙️  Config", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("q", "❌  Quit NVim", ":qa <CR>"),
    }

    -- Set footer
    dashboard.section.footer.val = {
      "                                                     ",
      "  🚀 Welcome to your Neovim setup!                   ",
      "  💡 Press <Space> to see all available commands     ",
      "                                                     ",
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
} 