return {
  -- Formatter for JSON and other languages
  {
    "mhartington/formatter.nvim",
    config = function()
      local util = require("formatter.util")
      
      require("formatter").setup({
        logging = false,
        filetype = {
          json = {
            function()
              return {
                exe = "jq",
                args = {
                  "--indent",
                  "2",
                  "--sort-keys",
                },
                stdin = true,
              }
            end,
          },
          lua = {
            function()
              return {
                exe = "stylua",
                args = {
                  "--search-parent-directories",
                  "--stdin-filepath",
                  util.escape_path(util.get_current_buffer_file_path()),
                  "--",
                  "-",
                },
                stdin = true,
              }
            end,
          },
          python = {
            function()
              return {
                exe = "black",
                args = { "--line-length", "88", "-" },
                stdin = true,
              }
            end,
          },
          cpp = {
            function()
              return {
                exe = "clang-format",
                args = { "-style=file" },
                stdin = true,
              }
            end,
          },
          c = {
            function()
              return {
                exe = "clang-format",
                args = { "-style=file" },
                stdin = true,
              }
            end,
          },
          javascript = {
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", util.escape_path(util.get_current_buffer_file_path()) },
                stdin = true,
              }
            end,
          },
          typescript = {
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", util.escape_path(util.get_current_buffer_file_path()) },
                stdin = true,
              }
            end,
          },
          html = {
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", util.escape_path(util.get_current_buffer_file_path()) },
                stdin = true,
              }
            end,
          },
          css = {
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", util.escape_path(util.get_current_buffer_file_path()) },
                stdin = true,
              }
            end,
          },
          markdown = {
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", util.escape_path(util.get_current_buffer_file_path()) },
                stdin = true,
              }
            end,
          },
          yaml = {
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", util.escape_path(util.get_current_buffer_file_path()) },
                stdin = true,
              }
            end,
          },
        },
      })
    end,
  },
} 