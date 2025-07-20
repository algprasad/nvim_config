return {
  --Catppuccin (Current - Chocolate Brown)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        styles = {
          comments = { "italic" },
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        integrations = {
          aerial = true,
          alpha = true,
          cmp = true,
          gitsigns = true,
          illuminate = true,
          indent_blankline = { enabled = true },
          mason = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          notify = true,
          neotree = true,
          treesitter = true,
          which_key = true,
        },
        color_overrides = {},
        custom_highlights = {},
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  
  -- Alternative Chocolate Themes (Uncomment to use)
  
  -- Tokyonight (Mocha variant - Warm chocolate browns)
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "moon", -- storm, moon, day, night
  --       transparent = false,
  --       terminal_colors = true,
  --       styles = {
  --         comments = { italic = true },
  --         keywords = { italic = true },
  --         functions = {},
  --         variables = {},
  --         sidebars = "dark",
  --         floats = "dark",
  --       },
  --       sidebars = { "qf", "help", "terminal", "NvimTree", "toggleterm" },
  --       day_brightness = 0.3,
  --       hide_inactive_statusline = false,
  --       dim_inactive = false,
  --       lualine_bold = false,
  --     })
  --     vim.cmd.colorscheme "tokyonight"
  --   end,
  -- },
  
  -- Gruvbox (Classic warm brown theme)
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("gruvbox").setup({
  --       terminal_colors = true,
  --       undercurl = true,
  --       underline = true,
  --       bold = true,
  --       italic = {
  --         strings = true,
  --         comments = true,
  --         operators = false,
  --         folds = true,
  --       },
  --       strikethrough = true,
  --       invert_selection = false,
  --       invert_signs = false,
  --       invert_tabline = false,
  --       invert_intend_guides = false,
  --       inverse = true,
  --       contrast = "medium", -- soft, medium, hard
  --       palette_overrides = {},
  --       overrides = {},
  --       dim_inactive = false,
  --       transparent_mode = false,
  --     })
  --     vim.cmd.colorscheme "gruvbox"
  --   end,
  -- },
  
  -- Material (Oceanic - Deep chocolate browns)
  -- {
  --   "marko-cerovac/material.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("material").setup({
  --       contrast = {
  --         terminal = false,
  --         sidebars = false,
  --         floating_windows = false,
  --         cursor_line = false,
  --         non_current_windows = false,
  --         filetypes = {},
  --       },
  --       styles = {
  --         comments = { italic = true },
  --         strings = {},
  --         keywords = {},
  --         functions = {},
  --         variables = {},
  --         operators = {},
  --         types = {},
  --       },
  --       plugins = {
  --         indent_blankline = {
  --           colored_indent_levels = false,
  --         },
  --         dashboard = "hyper",
  --         gitsigns = true,
  --         indent_blankline = true,
  --         nvim_cmp = true,
  --         nvim_tree = {
  --           contrast = true,
  --         },
  --         telescope = true,
  --         which_key = true,
  --       },
  --       disable = {
  --         colored_cursor_line = false,
  --         borders = false,
  --         background = false,
  --         term_colors = false,
  --         eob_lines = false,
  --       },
  --       high_visibility = {
  --         lighter = false,
  --         darker = false,
  --       },
  --       lualine_style = "default",
  --       async_loading = 1,
  --       custom_colors = nil,
  --       custom_highlights = {},
  --     })
  --     vim.g.material_style = "oceanic"
  --     vim.cmd.colorscheme "material"
  --   end,
  -- },
} 