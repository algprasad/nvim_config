return {
  -- Enhanced GitSigns configuration
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      })
    end,
  },

  -- Neogit for complete Git workflow
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "sindrets/diffview.nvim",
    },
    config = function()
      require("neogit").setup({
        disable_signs = false,
        disable_hint = false,
        disable_context_highlighting = false,
        disable_commit_confirmation = false,
        auto_refresh = true,
        disable_builtin_notifications = false,
        use_magit_keybindings = false,
        commit_popup = {
          kind = "floating",
        },
        popup = {
          kind = "floating",
        },
        kind = "floating",
        integrations = {
          diffview = true,
        },
        sections = {
          untracked = {
            folded = false,
          },
          unstaged = {
            folded = false,
          },
          staged = {
            folded = false,
          },
          stashes = {
            folded = true,
          },
          unpulled_upstream = {
            folded = true,
          },
          unmerged_upstream = {
            folded = false,
          },
          recent = {
            folded = true,
          },
          rebase = {
            folded = true,
          },
        },
        mappings = {
          finder = {
            ["<cr>"] = "Select",
            ["<c-c>"] = "Close",
            ["<esc>"] = "Close",
            ["<c-n>"] = "Next",
            ["<c-p>"] = "Previous",
            ["<down>"] = "Next",
            ["<up>"] = "Previous",
            ["<tab>"] = "MultiselectToggleNext",
            ["<s-tab>"] = "MultiselectTogglePrevious",
            ["<c-j>"] = "NOP",
          },
          main = {
            ["q"] = "Close",
            ["1"] = "Depth1",
            ["2"] = "Depth2",
            ["3"] = "Depth3",
            ["4"] = "Depth4",
            ["<tab>"] = "Toggle",
            ["x"] = "Discard",
            ["s"] = "Stage",
            ["S"] = "StageUnstaged",
            ["<c-s>"] = "StageAll",
            ["u"] = "Unstage",
            ["U"] = "UnstageStaged",
            ["d"] = "DiffAtFile",
            ["$"] = "CommandHistory",
            ["#"] = "Console",
            ["<cr>"] = "Action",
            ["<space>"] = "Toggle",
            ["?"] = "Help",
            ["D"] = "DiffPopup",
            ["p"] = "PullPopup",
            ["r"] = "RebasePopup",
            ["m"] = "MergePopup",
            ["P"] = "PushPopup",
            ["c"] = "CommitPopup",
            ["L"] = "LogPopup",
            ["Z"] = "StashPopup",
            ["A"] = "CherryPickPopup",
            ["b"] = "BranchPopup",
          },
          status = {
            ["q"] = "Close",
            ["I"] = "InitRepo",
            ["1"] = "Depth1",
            ["2"] = "Depth2",
            ["3"] = "Depth3",
            ["4"] = "Depth4",
            ["<tab>"] = "Toggle",
            ["x"] = "Discard",
            ["s"] = "Stage",
            ["S"] = "StageUnstaged",
            ["<c-s>"] = "StageAll",
            ["u"] = "Unstage",
            ["U"] = "UnstageStaged",
            ["d"] = "GoToFile",
            ["$"] = "CommandHistory",
            ["#"] = "Command",
            ["<cr>"] = "GoToFile",
            ["<space>"] = "Toggle",
            ["?"] = "Command",
            ["D"] = "GoToFile",
            ["p"] = "Command",
            ["r"] = "Command",
            ["m"] = "Command",
            ["P"] = "Command",
            ["c"] = "Command",
            ["L"] = "Command",
            ["Z"] = "Command",
            ["A"] = "Command",
            ["b"] = "Command",
          },
        },
      })
    end,
  },

  -- Diffview for better diff viewing
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        use_icons = true,
        icons = {
          folder_closed = "",
          folder_open = "",
        },
        signs = {
          fold_closed = "",
          fold_open = "",
        },
        file_panel = {
          win_config = {
            width = 35,
          },
        },
        view = {
          default = {
            layout = "diff2_horizontal",
            winbar_info = true,
          },
          file_history = {
            layout = "diff2_horizontal",
            winbar_info = true,
          },
        },
        floating_win_config = {
          border = "rounded",
          winblend = 0,
          width = 0.9,
          height = 0.8,
        },
        hooks = {
          diff_buf_read = function()
            -- Optional: customize diff buffer behavior
          end,
        },
        keymaps = {
          disable_defaults = false,
          view = {
            ["q"] = "<cmd>DiffviewClose<cr>",
            ["<esc>"] = "<cmd>DiffviewClose<cr>",
          },
          file_panel = {
            ["q"] = "<cmd>DiffviewClose<cr>",
            ["<esc>"] = "<cmd>DiffviewClose<cr>",
          },
        },
      })
    end,
  },
} 
