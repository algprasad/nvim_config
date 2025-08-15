return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        -- Essential text wrapping and display fixes
        wrap_results = true,
        layout_config = {
          width = 0.95,
          height = 0.85,
          preview_cutoff = 120,
        },
        
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        live_grep = {
          layout_config = {
            width = 0.95,
            height = 0.85,
          },
          -- Show more of the filename by adjusting display
          path_display = { "smart" },
          -- Alternative: path_display = { "truncate" } or { "tail" } or { "absolute" }
        },
        lsp_references = {
          layout_config = {
            width = 0.95,
            height = 0.85,
          },
          -- Show full file paths without truncation
          path_display = { "absolute" },
          -- Allow text wrapping for paths
          wrap_results = true,
          -- Custom entry maker to show only file paths
          entry_maker = function(entry)
            local display = entry.filename .. ":" .. entry.lnum
            return {
              value = entry,
              display = display,
              ordinal = entry.filename,
              filename = entry.filename,
              lnum = entry.lnum,
              col = entry.col,
            }
          end,
        },
      },
    })
  end,
} 