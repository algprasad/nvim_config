return {
  -- Catppuccin Theme (Reliable and well-supported)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    -- priority = 1000,
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
        color_overrides = {
          mocha = {
            -- Override base colors (example customizations)
            base = "#1a1a1a",      -- Background
            mantle = "#151515",    -- Darker background
            crust = "#101010",     -- Darkest background
            
            -- Accent colors
            rosewater = "#f5e0dc", 
            flamingo = "#f2cdcd",
            pink = "#f5c2e7",
            mauve = "#cba6fb",     -- Purple
            red = "#f38ba8",
            maroon = "#eba0ac",
            peach = "#fab387",     -- Orange
            yellow = "#f9e2af",
            green = "#a6e3a1",
            teal = "#94e2d5",
            sky = "#89dceb",
            sapphire = "#74c7ec",
            blue = "#89b4fa",
            lavender = "#b4befe",
            
            -- Text colors
            text = "#cdd6f4",
            subtext1 = "#bac2de",
            subtext0 = "#a6adc8",
            overlay2 = "#9399b2",
            overlay1 = "#7f849c",
            overlay0 = "#6c7086",
            surface2 = "#585b70",
            surface1 = "#45475a",
            surface0 = "#313244",
          }
        },
        custom_highlights = {
          -- Custom highlight overrides
          Comment = { fg = "#6c7086", style = { "italic" } },
          Function = { fg = "#89b4fa", style = { "bold" } },
          Keyword = { fg = "#cba6fb", style = { "italic" } },
          String = { fg = "#a6e3a1" },
          Number = { fg = "#fab387" },
          Boolean = { fg = "#f38ba8" },
        },
      })
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },
  
  -- Alternative Themes (Uncomment to use instead of Catppuccin)
  
  -- Tokyo Night (Modern dark theme with great contrast)
  {
    "folke/tokyonight.nvim",
    lazy = true,
    -- priority = 1000,  -- Uncomment to use this theme
    config = function()
      require("tokyonight").setup({
        style = "night", -- storm, moon, day, night
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
        sidebars = { "qf", "help", "terminal", "NvimTree", "toggleterm" },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
        on_highlights = function(hl, c)
          -- Custom color adjustments
          hl.Function = { fg = c.blue, bold = true }
          hl.String = { fg = c.green }
          hl.Keyword = { fg = c.purple, italic = true }
        end,
      })
      -- vim.cmd.colorscheme("tokyonight")  -- Uncomment to activate
    end,
  },
  
  -- Gruvbox (Classic warm brown theme)
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    -- priority = 1000,  -- Uncomment to use this theme
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,
        contrast = "hard", -- soft, medium, hard
        palette_overrides = {
          -- Custom color overrides for Gruvbox
          bright_green = "#b8bb26",
          bright_blue = "#83a598",
          bright_purple = "#d3869b",
        },
        overrides = {
          Function = { fg = "#83a598", bold = true },
          String = { fg = "#b8bb26" },
          Keyword = { fg = "#fb4934", italic = true },
        },
        dim_inactive = false,
        transparent_mode = false,
      })
      -- vim.cmd.colorscheme("gruvbox")  -- Uncomment to activate
    end,
  },
  
  -- OneDark (VS Code-inspired theme)
  {
    "navarasu/onedark.nvim",
    lazy = true,
    -- priority = 1000,  -- Uncomment to use this theme
    config = function()
      require("onedark").setup({
        style = "dark", -- dark, darker, cool, deep, warm, warmer
        transparent = false,
        term_colors = true,
        ending_tildes = false,
        cmp_itemkind_reverse = false,
        code_style = {
          comments = "italic",
          keywords = "bold",
          functions = "bold",
          strings = "none",
          variables = "none"
        },
        colors = {
          -- Custom color overrides
          purple = "#c678dd",
          blue = "#61afef", 
          green = "#98c379",
          red = "#e06c75",
        },
        highlights = {
          Function = { fg = "$blue", fmt = "bold" },
          String = { fg = "$green" },
          Keyword = { fg = "$purple", fmt = "bold,italic" },
        }
      })
      -- vim.cmd.colorscheme("onedark")  -- Uncomment to activate
    end,
  },

  -- Dracula (Popular dark theme)
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,  -- Uncomment to use this theme  
    config = function()
      require("dracula").setup({
        colors = {
          bg = "#282a36",
          fg = "#f8f8f2",
          selection = "#44475a",
          comment = "#6272a4",
          red = "#ff5555",
          orange = "#ffb86c", 
          yellow = "#f1fa8c",
          green = "#50fa7b",
          purple = "#bd93f9",
          cyan = "#8be9fd",
          pink = "#ff79c6",
        },
        show_end_of_buffer = true,
        transparent_bg = false,
        lualine_bg_color = "#44475a",
        italic_comment = true,
      })
      vim.cmd.colorscheme("dracula")  -- Uncomment to activate
    end,
  },

     -- Kanagawa (Chocolate/brown inspired Japanese theme)
   {
     "rebelot/kanagawa.nvim",
     lazy = false,
    --  priority = 1000,  -- Uncomment to use this theme
     config = function()
       require("kanagawa").setup({
         compile = false,
         undercurl = true,
         commentStyle = { italic = true },
         functionStyle = { bold = true },
         keywordStyle = { italic = true },
         statementStyle = { bold = true },
         typeStyle = {},
         transparent = false,
         dimInactive = false,
         terminalColors = true,
         colors = {
           palette = {
             -- Custom chocolate/brown colors
             sumiInk0 = "#16161D",     -- Dark chocolate background
             sumiInk1 = "#1F1F28",     -- Chocolate background
             sumiInk3 = "#363646",     -- Lighter chocolate
             fujiWhite = "#DCD7BA",    -- Cream text
             oldWhite = "#C8C093",     -- Warm white
             
             -- Chocolate accent colors
             autumnRed = "#C34043",    -- Deep red
             autumnGreen = "#76946A",  -- Forest green  
             autumnYellow = "#DCA561", -- Golden yellow
             waveBlue1 = "#223249",    -- Dark blue
             waveBlue2 = "#2D4F67",    -- Blue
             springBlue = "#7E9CD8",   -- Light blue
             oniViolet = "#957FB8",    -- Purple
             crystalBlue = "#7FB4CA",  -- Cyan
             springGreen = "#98BB6C",  -- Green
             boatYellow1 = "#938056",  -- Brown yellow
             boatYellow2 = "#C0A36E",  -- Golden
           },
         },
         overrides = function(colors)
           return {
             Function = { fg = colors.palette.crystalBlue, bold = true },
             String = { fg = colors.palette.springGreen },
             Keyword = { fg = colors.palette.oniViolet, italic = true },
             Comment = { fg = colors.palette.fujiGray, italic = true },
           }
         end,
       })
      --  vim.cmd.colorscheme("kanagawa")  -- Uncomment to activate
     end,
   },

   -- Everforest (Warm chocolate/forest theme) 
   {
     "sainnhe/everforest",
     lazy = true,
     -- priority = 1000,  -- Uncomment to use this theme
     config = function()
       -- Configuration for Everforest
       vim.g.everforest_style = 'hard'  -- 'soft', 'medium', 'hard'
       vim.g.everforest_better_performance = 1
       vim.g.everforest_background = 'hard'  -- 'soft', 'medium', 'hard'
       vim.g.everforest_enable_italic = 1
       vim.g.everforest_disable_italic_comment = 0
       vim.g.everforest_transparent_background = 0
       vim.g.everforest_dim_inactive_windows = 0
       vim.g.everforest_diagnostic_text_highlight = 1
       vim.g.everforest_diagnostic_line_highlight = 0
       vim.g.everforest_diagnostic_virtual_text = 'colored'
       vim.g.everforest_current_word = 'grey background'
       
       -- Custom highlights for chocolate feel
       vim.api.nvim_create_autocmd("ColorScheme", {
         pattern = "everforest",
         callback = function()
           vim.api.nvim_set_hl(0, "Function", { fg = "#7FBBB3", bold = true })
           vim.api.nvim_set_hl(0, "String", { fg = "#A7C080" })
           vim.api.nvim_set_hl(0, "Keyword", { fg = "#E67E80", italic = true })
           vim.api.nvim_set_hl(0, "Type", { fg = "#DBBC7F", bold = true })
         end,
       })
       
      --  vim.cmd.colorscheme("everforest")  -- Uncomment to activate
     end,
   },

   -- Chocolate-inspired custom Gruvbox variant
   {
     "luisiacc/gruvbox-baby",
     lazy = true,
     -- priority = 1000,  -- Uncomment to use this theme
     config = function()
       vim.g.gruvbox_baby_function_style = "bold"
       vim.g.gruvbox_baby_keyword_style = "italic"
       vim.g.gruvbox_baby_comment_style = "italic"
       vim.g.gruvbox_baby_string_style = "italic"
       vim.g.gruvbox_baby_variable_style = ""
       vim.g.gruvbox_baby_highlights = {
         Function = { fg = "#d3869b", style = "bold" },
         String = { fg = "#b8bb26", style = "italic" },
         Keyword = { fg = "#fb4934", style = "bold,italic" },
         Type = { fg = "#fabd2f", style = "bold" },
         Comment = { fg = "#928374", style = "italic" },
       }
       vim.g.gruvbox_baby_transparent_mode = 0
       vim.g.gruvbox_baby_background_color = "dark"  -- dark, medium, light
       
       -- vim.cmd.colorscheme("gruvbox-baby")  -- Uncomment to activate
     end,
   },

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