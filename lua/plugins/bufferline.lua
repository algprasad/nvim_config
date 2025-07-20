return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- set to "tabs" to only show tabpages instead
          separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' } | "slant" | "padded_slant"
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          color_icons = true,
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(_, _, diag)
            local ret = (diag.error and "● " .. diag.error .. " " or "")
                .. (diag.warning and "● " .. diag.warning or "")
            return vim.trim(ret)
          end,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
            },
          },
          custom_areas = {
            right = function()
              local result = {}
              local error = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
              local warning = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
              local info = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
              local hint = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

              if #error > 0 then
                table.insert(result, { text = "  " .. #error .. " ", guifg = "#ff0000" })
              end
              if #warning > 0 then
                table.insert(result, { text = "  " .. #warning .. " ", guifg = "#ffa500" })
              end
              if #info > 0 then
                table.insert(result, { text = "  " .. #info .. " ", guifg = "#0000ff" })
              end
              if #hint > 0 then
                table.insert(result, { text = "  " .. #hint .. " ", guifg = "#00ff00" })
              end
              return result
            end,
          },
        },
        highlights = {
          buffer_selected = {
            bold = true,
            italic = true,
          },
          buffer_visible = {
            italic = true,
          },
        },
      })
    end,
  },
} 