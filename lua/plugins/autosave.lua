return {
  -- Auto-save plugin
  {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    config = function()
      require("auto-save").setup({
        -- Enable auto-save
        enabled = true,
        
        -- Auto-save when leaving insert mode
        trigger_events = {
          immediate_save = { "BufLeave", "FocusLost" },
          defer_save = { "InsertLeave", "TextChanged" },
          cancel_deferred_save = { "InsertEnter" },
        },
        
        -- Conditions for auto-save
        condition = function(buf)
          local fn = vim.fn
          local utils = require("auto-save.utils.data")

          -- Don't save if buffer is not modifiable
          if not vim.bo[buf].modifiable then
            return false
          end

          -- Don't save if buffer is read-only
          if vim.bo[buf].readonly then
            return false
          end

          -- Don't save if no file name
          if fn.empty(fn.expand("%:t")) ~= 0 then
            return false
          end

          -- Don't save certain file types
          local ignore_filetypes = {
            "oil",
            "TelescopePrompt",
            "alpha",
            "dashboard",
            "NvimTree",
            "copilot-chat",
            "toggleterm",
          }
          
          if utils.not_in(fn.getbufvar(buf, "&filetype"), ignore_filetypes) then
            return true
          end
          return false
        end,
        
        -- Write all buffers before executing auto-save
        write_all_buffers = false,
        
        -- Auto-save delay (in ms)
        debounce_delay = 1000,
        
        -- Show message when auto-saving
        callbacks = {
          enabling = function()
            vim.notify("Auto-save enabled", vim.log.levels.INFO)
          end,
          disabling = function()
            vim.notify("Auto-save disabled", vim.log.levels.INFO)
          end,
          before_saving = function()
            -- You can add custom logic here before saving
          end,
          after_saving = function()
            -- Uncomment to show save notifications
            -- vim.notify("File auto-saved", vim.log.levels.INFO)
          end,
        },
      })
    end,
  },
} 