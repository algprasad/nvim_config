return {
  -- Enhanced C++ tools for function generation
  {
    "Badhi/nvim-treesitter-cpp-tools",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "cpp", "c" },
    config = function()
      require("nt-cpp-tools").setup({
        preview = {
          quit = "q", -- quit preview window
          accept = "<tab>", -- accept suggestion
        },
        header_extension = "h", -- header extension
        source_extension = "cpp", -- source extension
        custom_define_class_function_commands = {
          TSCppImplWrite = {
            output_handle = require("nt-cpp-tools.output_handlers").get_add_to_cpp(),
          },
        }
      })
    end,
  },
  
  -- Alternative: clangd extensions for better C++ support
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
    config = function()
      require("clangd_extensions").setup({
        server = {
          -- Let lspconfig handle clangd setup
        },
        extensions = {
          -- Enable inlay hints
          inlay_hints = {
            inline = vim.fn.has("nvim-0.10") == 1,
            only_current_line = false,
            only_current_line_autocmd = "CursorHold",
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
            priority = 100,
          },
          
          -- Enable code actions
          ast = {
            role_icons = {
              type = "",
              declaration = "",
              expression = "",
              specifier = "",
              statement = "",
              ["template argument"] = "",
            },
            kind_icons = {
              Compound = "",
              Recovery = "",
              TranslationUnit = "",
              PackExpansion = "",
              TemplateTypeParm = "",
              TemplateTemplateParm = "",
              TemplateParamObject = "",
            },
          },
        },
      })
    end,
  },
} 