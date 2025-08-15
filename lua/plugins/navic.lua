return {
  -- LSP-based breadcrumbs for function/class context
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require("nvim-navic").setup({
        -- Icons for different symbol types
        icons = {
          File          = "󰈙 ",
          Module        = " ",
          Namespace     = "󰌗 ",
          Package       = " ",
          Class         = "󰌗 ",
          Method        = "󰆧 ",
          Property      = " ",
          Field         = " ",
          Constructor   = " ",
          Enum          = "󰕘 ",
          Interface     = "󰕘 ",
          Function      = "󰊕 ",
          Variable      = "󰆧 ",
          Constant      = "󰏿 ",
          String        = "󰀬 ",
          Number        = "󰎠 ",
          Boolean       = "◩ ",
          Array         = "󰅪 ",
          Object        = "󰅩 ",
          Key           = "󰌋 ",
          Null          = "󰟢 ",
          EnumMember    = " ",
          Struct        = "󰌗 ",
          Event         = " ",
          Operator      = "󰆕 ",
          TypeParameter = "󰊄 ",
        },
        -- Highlight groups
        highlight = true,
        -- Separator between symbols
        separator = " > ",
        -- Depth limit
        depth_limit = 0,
        -- Depth limit indicator
        depth_limit_indicator = "..",
        -- Safe output (prevent crashes)
        safe_output = true,
        -- Lazy update context
        lazy_update_context = false,
        -- Click handler
        click = false,
      })
    end,
  },
} 
