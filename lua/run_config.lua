local M = {}

-- Default launch configurations
local default_configs = {
  -- C++ configurations
  cpp = {
    {
      name = "Debug C++",
      type = "cppdbg",
      request = "launch",
      program = "${workspaceFolder}/build/${fileBasenameNoExtension}",
      args = {},
      stopAtEntry = false,
      cwd = "${workspaceFolder}",
      environment = {},
      externalConsole = false,
      MIMode = "lldb",
      setupCommands = {
        {
          description = "Enable pretty-printing for lldb",
          text = "-enable-pretty-printing",
          ignoreFailures = true,
        },
      },
    },
    {
      name = "Release C++",
      type = "cppdbg",
      request = "launch",
      program = "${workspaceFolder}/build/${fileBasenameNoExtension}",
      args = {},
      stopAtEntry = false,
      cwd = "${workspaceFolder}",
      environment = {},
      externalConsole = false,
      MIMode = "lldb",
    },
  },
  
  -- Python configurations
  python = {
    {
      name = "Debug Python",
      type = "python",
      request = "launch",
      program = "${file}",
      args = {},
      console = "integratedTerminal",
      cwd = "${workspaceFolder}",
      env = {},
    },
    {
      name = "Run Python Module",
      type = "python",
      request = "launch",
      module = "main",
      args = {},
      console = "integratedTerminal",
      cwd = "${workspaceFolder}",
      env = {},
    },
  },
  
  -- Node.js configurations
  javascript = {
    {
      name = "Debug Node.js",
      type = "node",
      request = "launch",
      program = "${file}",
      args = {},
      cwd = "${workspaceFolder}",
      env = {},
    },
    {
      name = "Debug TypeScript",
      type = "node",
      request = "launch",
      program = "${workspaceFolder}/node_modules/.bin/ts-node",
      args = {"${file}"},
      cwd = "${workspaceFolder}",
      env = {},
    },
  },
  
  -- Go configurations
  go = {
    {
      name = "Debug Go",
      type = "go",
      request = "launch",
      mode = "debug",
      program = "${fileDirname}",
      args = {},
      cwd = "${workspaceFolder}",
      env = {},
    },
  },
  
  -- Rust configurations
  rust = {
    {
      name = "Debug Rust",
      type = "lldb",
      request = "launch",
      program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}",
      args = {},
      cwd = "${workspaceFolder}",
      env = {},
    },
  },
}

-- Load project-specific launch configurations
local function load_project_config()
  local config_file = vim.fn.getcwd() .. "/.nvim-launch.json"
  if vim.fn.filereadable(config_file) == 1 then
    local content = vim.fn.readfile(config_file)
    local success, config = pcall(vim.json.decode, table.concat(content, "\n"))
    if success then
      return config
    end
  end
  return {}
end

-- Variable substitution
local function substitute_variables(str, file_path)
  local substitutions = {
    ["${workspaceFolder}"] = vim.fn.getcwd(),
    ["${workspaceFolderBasename}"] = vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
    ["${file}"] = file_path or vim.fn.expand("%:p"),
    ["${fileBasename}"] = vim.fn.expand("%:t"),
    ["${fileBasenameNoExtension}"] = vim.fn.expand("%:t:r"),
    ["${fileDirname}"] = vim.fn.expand("%:p:h"),
    ["${fileExtname}"] = vim.fn.expand("%:e"),
  }
  
  for key, value in pairs(substitutions) do
    str = str:gsub(key, value)
  end
  
  return str
end

-- Build command from configuration
local function build_command(config, file_path)
  local cmd = {}
  
  if config.type == "cppdbg" then
    -- C++ debug configuration
    if config.program then
      table.insert(cmd, config.program)
    end
    if config.args then
      for _, arg in ipairs(config.args) do
        table.insert(cmd, arg)
      end
    end
  elseif config.type == "python" then
    -- Python configuration
    if config.module then
      table.insert(cmd, "python")
      table.insert(cmd, "-m")
      table.insert(cmd, config.module)
    elseif config.program then
      table.insert(cmd, "python")
      table.insert(cmd, config.program)
    end
    if config.args then
      for _, arg in ipairs(config.args) do
        table.insert(cmd, arg)
      end
    end
  elseif config.type == "node" then
    -- Node.js configuration
    if config.program then
      table.insert(cmd, "node")
      table.insert(cmd, config.program)
    end
    if config.args then
      for _, arg in ipairs(config.args) do
        table.insert(cmd, arg)
      end
    end
  elseif config.type == "go" then
    -- Go configuration
    table.insert(cmd, "go")
    table.insert(cmd, "run")
    table.insert(cmd, config.program)
    if config.args then
      for _, arg in ipairs(config.args) do
        table.insert(cmd, arg)
      end
    end
  elseif config.type == "lldb" then
    -- Rust/LLDB configuration
    table.insert(cmd, config.program)
    if config.args then
      for _, arg in ipairs(config.args) do
        table.insert(cmd, arg)
      end
    end
  else
    -- Generic command
    if config.command then
      table.insert(cmd, config.command)
    end
    if config.args then
      for _, arg in ipairs(config.args) do
        table.insert(cmd, arg)
      end
    end
  end
  
  -- Substitute variables
  for i, part in ipairs(cmd) do
    cmd[i] = substitute_variables(part, file_path)
  end
  
  return cmd
end

-- Run configuration
function M.run_config(config_name, file_path)
  local project_configs = load_project_config()
  local filetype = vim.bo.filetype
  local configs = project_configs[filetype] or default_configs[filetype] or {}
  
  -- Find the configuration
  local selected_config = nil
  for _, config in ipairs(configs) do
    if config.name == config_name then
      selected_config = config
      break
    end
  end
  
  if not selected_config then
    vim.notify("Configuration '" .. config_name .. "' not found", vim.log.levels.ERROR)
    return
  end
  
  -- Build and run command
  local cmd = build_command(selected_config, file_path)
  if #cmd == 0 then
    vim.notify("No command to run", vim.log.levels.ERROR)
    return
  end
  
  -- Set working directory
  local cwd = selected_config.cwd
  if cwd then
    cwd = substitute_variables(cwd, file_path)
  else
    cwd = vim.fn.getcwd()
  end
  
  -- Set environment variables
  local env = {}
  if selected_config.env then
    for key, value in pairs(selected_config.env) do
      env[key] = substitute_variables(value, file_path)
    end
  end
  
  -- Run in terminal
  local Terminal = require("toggleterm.terminal").Terminal
  local cmd_str = table.concat(cmd, " ")
  
  -- Create environment string
  local env_str = ""
  for key, value in pairs(env) do
    env_str = env_str .. key .. "=" .. value .. " "
  end
  
  local full_cmd = env_str .. cmd_str
  
  local term = Terminal:new({
    cmd = full_cmd,
    dir = cwd,
    direction = "float",
    size = 80,
    close_on_exit = false,
  })
  
  term:toggle()
  vim.notify("Running: " .. full_cmd, vim.log.levels.INFO)
end

-- Show configuration picker
function M.show_configs()
  local project_configs = load_project_config()
  local filetype = vim.bo.filetype
  local configs = project_configs[filetype] or default_configs[filetype] or {}
  
  if #configs == 0 then
    vim.notify("No configurations found for filetype: " .. filetype, vim.log.levels.WARN)
    return
  end
  
  -- Create picker items
  local items = {}
  for _, config in ipairs(configs) do
    table.insert(items, {
      text = config.name,
      description = config.type .. " - " .. (config.program or config.command or "No program"),
    })
  end
  
  -- Use telescope or simple picker
  if pcall(require, "telescope") then
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    
    pickers.new({}, {
      prompt_title = "Launch Configurations",
      finder = finders.new_table({
        results = items,
        entry_maker = function(entry)
          return {
            value = entry.text,
            display = entry.text,
            ordinal = entry.text,
            description = entry.description,
          }
        end,
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          M.run_config(selection.value)
        end)
        return true
      end,
    }):find()
  else
    -- Fallback to vim.ui.select
    vim.ui.select(items, {
      prompt = "Select launch configuration:",
      format_item = function(item)
        return item.text .. " - " .. item.description
      end,
    }, function(choice)
      if choice then
        M.run_config(choice.text)
      end
    end)
  end
end

-- Create launch.json template
function M.create_template()
  local template = {
    cpp = {
      {
        name = "Debug C++",
        type = "cppdbg",
        request = "launch",
        program = "${workspaceFolder}/build/${fileBasenameNoExtension}",
        args = {},
        stopAtEntry = false,
        cwd = "${workspaceFolder}",
        environment = {},
        externalConsole = false,
        MIMode = "lldb",
      },
    },
    python = {
      {
        name = "Debug Python",
        type = "python",
        request = "launch",
        program = "${file}",
        args = {},
        console = "integratedTerminal",
        cwd = "${workspaceFolder}",
        env = {},
      },
    },
  }
  
  local config_file = vim.fn.getcwd() .. "/.nvim-launch.json"
  local content = vim.json.encode(template, { indent = 2 })
  vim.fn.writefile(vim.fn.split(content, "\n"), config_file)
  vim.notify("Created .nvim-launch.json template", vim.log.levels.INFO)
end

return M 