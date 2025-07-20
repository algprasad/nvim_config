-- beautiful cmdline 
return  {
  "folke/noice.nvim",
  lazy=false,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "stevearc/dressing.nvim",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = false,        -- use classic bottom cmdline for `/` and `?`
      command_palette = true,       -- position the command line in the center
      long_message_to_split = true, -- long messages go to a split
      inc_rename = false,           -- enable input dialog for `:IncRename`
      lsp_doc_border = true,        -- add border to hover docs and signature help
    },
  }
}
