return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Function to get current function/class context
    local function get_function_context()
      -- Try to get LSP symbol information
      local ok, navic = pcall(require, "nvim-navic")
      if ok and navic.is_available() then
        return navic.get_location()
      end
      
      -- Fallback: try treesitter
      local ts_utils = require('nvim-treesitter.ts_utils')
      local parsers = require('nvim-treesitter.parsers')
      
      if not parsers.has_parser() then
        return ""
      end
      
      local current_node = ts_utils.get_node_at_cursor()
      if not current_node then
        return ""
      end
      
      -- Walk up the tree to find function/class/method nodes
      local function_name = ""
      local class_name = ""
      
      while current_node do
        local node_type = current_node:type()
        
        -- C++ specific nodes
        if node_type == "function_definition" or 
           node_type == "function_declarator" or
           node_type == "method_definition" then
          local name_node = current_node:field("declarator")[1]
          if name_node then
            function_name = vim.treesitter.get_node_text(name_node, 0) or ""
          end
        elseif node_type == "class_specifier" or 
               node_type == "struct_specifier" then
          local name_node = current_node:field("name")[1]
          if name_node then
            class_name = vim.treesitter.get_node_text(name_node, 0) or ""
          end
        end
        
        current_node = current_node:parent()
      end
      
      if class_name ~= "" and function_name ~= "" then
        return class_name .. "::" .. function_name
      elseif function_name ~= "" then
        return function_name
      elseif class_name ~= "" then
        return class_name
      else
        return ""
      end
    end

    require("lualine").setup({
      options = {
        theme = "auto", -- Use auto to match current colorscheme
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        icons_enabled = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { 
          "filename",
          {
            get_function_context,
            icon = "󰊕",
            color = { fg = "#61afef", gui = "bold" },
            separator = { left = " ", right = " " },
          }
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = { "nvim-tree", "toggleterm", "telescope" }
    })
  end,
} 