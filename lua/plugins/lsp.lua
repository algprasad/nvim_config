return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    -- Mason setup
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "pyright",
        "lua_ls",
        "cmake",
        "bashls", -- Bash Language Server
        "shellcheck"       
      },
      automatic_installation = true,
    })

    -- CMP setup
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      }),
    })

    -- LSP configs
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Clangd for C++
    require("lspconfig").clangd.setup({
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
        "--suggest-missing-includes",
        "--cross-file-rename",
        "--enable-config",
      },
      filetypes = {"c", "cpp", "h", "cc", "hpp"},
      root_dir = require("lspconfig").util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
      
      on_attach = function(client, bufnr)
        -- Enable LSP inlay hints
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true)
        end
        
        -- Attach navic for breadcrumbs
        if client.server_capabilities.documentSymbolProvider then
          local navic = require("nvim-navic")
          navic.attach(client, bufnr)
        end
        
        -- Set up C++ specific keymaps (only buffer-specific ones)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        
        -- C++ specific code actions for this buffer only
        vim.keymap.set("n", "<leader>ch", function()
          vim.lsp.buf.code_action({
            filter = function(action)
              return action.title:match("Add.*include") or 
                     action.title:match("Generate") or
                     action.title:match("Create") or
                     action.title:match("Implement") or
                     action.title:match("Define")
            end,
          })
        end, opts)
        
        -- Quick apply function generation for C++ files
        vim.keymap.set("n", "<leader>cq", function()
          vim.lsp.buf.code_action({
            filter = function(action)
              return action.title:match("Define") or 
                     action.title:match("Create function") or
                     action.title:match("Generate") or
                     action.title:match("Implement")
            end,
            apply = true,
          })
        end, opts)
      end,
      
      -- Enhanced settings for better C++ support
      settings = {
        clangd = {
          InlayHints = {
            Designators = true,
            Enabled = true,
            ParameterNames = true,
            DeducedTypes = true,
          },
          fallbackFlags = { "-std=c++17" },
        },
      },
    })

    -- Pyright for Python
    require("lspconfig").pyright.setup({
      capabilities = capabilities,
      root_dir = require("lspconfig.util").root_pattern(
        "pyrightconfig.json",
        "pyproject.toml", 
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyproject.toml",
        ".git"
      ),
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    -- Lua LSP
    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- CMake LSP
    require("lspconfig").cmake.setup({
      capabilities = capabilities,
      settings = {
        cmake = {
          buildDirectory = "build",
          configureSettings = {},
          sourceDirectory = ".",
          generator = "Unix Makefiles",
          buildType = "Debug",
          installPrefix = "/usr/local",
          parallelJobs = 4,
          trace = false,
          debug = false,
        },
      },
    })

    -- Bash LSP
    require("lspconfig").bashls.setup({
      capabilities = capabilities,
      filetypes = { "sh", "bash", "zsh" },
      settings = {
        bashIde = {
          globPattern = "*@(.sh|.inc|.bash|.command)",
          enableSourceErrorDiagnostics = true,
          shellcheckPath = "shellcheck",
          includeAllWorkspaceSymbols = true,
        },
      },
      on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        
        -- Bash-specific settings (global keymaps are handled elsewhere)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        -- Add any bash-specific keymaps here if needed
      end,
    })
  end,
} 
