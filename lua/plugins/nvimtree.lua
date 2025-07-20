return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
      -- Auto refresh settings
      git = {
        enable = true,
        ignore = false,
      },
      -- Auto refresh on file system changes
      filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {
          "node_modules",
          ".git",
          "build",
          "dist",
          "target",
        },
      },
      -- Auto refresh on focus
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    })
  end,
} 