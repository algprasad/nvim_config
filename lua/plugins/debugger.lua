return {
  -- Debug Adapter Protocol
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- Creates a beautiful debugger UI
      "rcarriga/nvim-dap-ui",
      -- Installs the debug adapters for you
      "jay-babu/mason-nvim-dap.nvim",
      -- Add virtual text to debugger
      "theHamsta/nvim-dap-virtual-text",
      -- Required by nvim-dap-ui
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Setup dap-ui
      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.33 },
              { id = "breakpoints", size = 0.17 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 0.33,
            position = "right",
          },
          {
            elements = {
              { id = "repl", size = 0.45 },
              { id = "console", size = 0.55 },
            },
            size = 0.27,
            position = "bottom",
          },
        },
      })

      -- Setup virtual text
      require("nvim-dap-virtual-text").setup({
        commented = true,
      })

      -- Configure breakpoint signs
      vim.fn.sign_define('DapBreakpoint', {text='●', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint'})
      vim.fn.sign_define('DapBreakpointCondition', {text='●', texthl='DapBreakpointCondition', linehl='DapBreakpointCondition', numhl='DapBreakpointCondition'})
      vim.fn.sign_define('DapLogPoint', {text='●', texthl='DapLogPoint', linehl='DapLogPoint', numhl='DapLogPoint'})
      vim.fn.sign_define('DapStopped', {text='●', texthl='DapStopped', linehl='DapStopped', numhl='DapStopped'})

      -- Automatically open dap-ui when debugging starts
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      -- Automatically close dap-ui when debugging ends
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Custom highlight groups for breakpoints
      vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#ff0000', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'DapBreakpointCondition', { fg = '#ffa500', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#00ff00', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#00ffff', bg = 'NONE' })

      -- C++ Debugger Configuration
      -- Configure the C++ debugger (using lldb)
      dap.adapters.cppdbg = {
        type = 'executable',
        command = '/usr/bin/lldb', 
        name = "cppdbg",
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
          args = {},
          runInTerminal = false,
          MIMode = "lldb",
          miDebuggerPath = "/usr/bin/lldb",
          setupCommands = {
            {
              description = "Enable pretty-printing for lldb",
              text = "-enable-pretty-printing",
              ignoreFailures = true,
            },
          },
        },
        {
          name = "Attach to lldbserver :1234",
          type = "cppdbg",
          request = "launch",
          MIMode = "lldb",
          miDebuggerServerAddress = "localhost:1234",
          miDebuggerPath = "/usr/bin/lldb",
          cwd = "${workspaceFolder}",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
        },
      }

      -- C Debugger Configuration (same as C++)
      dap.configurations.c = dap.configurations.cpp

      -- Python Debugger Configuration
      dap.adapters.python = {
        type = "executable",
        command = vim.fn.getcwd() .. "/.venv/bin/python",
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return vim.fn.getcwd() .. "/.venv/bin/python"
          end,
        },
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to include whatever tools you want to install
        -- for debugging
        "cpptools",
        "debugpy",
      },
    },
  },
} 
