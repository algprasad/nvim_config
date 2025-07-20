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

      -- C++ Debugger Configuration
      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = "cpptools",
        args = {},
        options = {
          detached = false,
        },
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
          MIMode = "gdb",
          miDebuggerPath = "/usr/bin/gdb",
          setupCommands = {
            {
              description = "Enable pretty-printing for gdb",
              text = "-enable-pretty-printing",
              ignoreFailures = true,
            },
          },
        },
        {
          name = "Attach to gdbserver :1234",
          type = "cppdbg",
          request = "launch",
          MIMode = "gdb",
          miDebuggerServerAddress = "localhost:1234",
          miDebuggerPath = "/usr/bin/gdb",
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
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          name = "Launch file",
          type = "python",
          request = "launch",
          program = "${file}",
          console = "integratedTerminal",
          justMyCode = true,
        },
        {
          name = "Launch file (external terminal)",
          type = "python",
          request = "launch",
          program = "${file}",
          console = "externalTerminal",
          justMyCode = true,
        },
        {
          name = "Attach to process",
          type = "python",
          request = "attach",
          processId = function()
            return tonumber(vim.fn.input("Process ID: "))
          end,
          justMyCode = true,
        },
        {
          name = "Attach by address",
          type = "python",
          request = "attach",
          connect = function()
            local host = vim.fn.input("Host [127.0.0.1]: ", "127.0.0.1")
            local port = tonumber(vim.fn.input("Port [5678]: ", "5678"))
            return { host = host, port = port }
          end,
          justMyCode = true,
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