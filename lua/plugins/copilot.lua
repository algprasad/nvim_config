return {
  -- GitHub Copilot for AI code completion
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_enabled = true
      -- vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
    end,
  },
  
  -- Copilot Chat for explanations and fixes
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      show_help = "no",
      debug = false,
      language = "English",
      model = "gpt-4",
      temperature = 0.1,
      -- Floating window configuration
      window = {
        layout = "float",
        relative = "editor",
        width = 0.8,
        height = 0.8,
        -- Center the floating window
        center = true,
        style = "minimal",
        border = "rounded",
        winblend = 0,
        zindex = 1000,
      },
      -- Auto-close floating window when done
      auto_close = true,
      -- Show system messages
      show_system_messages = false,
      -- Enable file editing capabilities
      auto_follow_cursor = false,
      auto_insert_mode = false,
      clear_chat_on_new_prompt = false,
      history_path = vim.fn.stdpath("data") .. "/copilotchat_history",
      -- Question header
      question_header = "## User ",
      -- Answer header
      answer_header = "## Copilot ",
      -- Error header
      error_header = "## Error ",
      -- Separator
      separator = "---",
      -- Show folds
      show_folds = true,
      -- Highlight
      highlight_selection = true,
      -- Context
      context = nil,
      -- Callback for after response
      callback = nil,
    },
    event = "VeryLazy",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
    },
  },
} 