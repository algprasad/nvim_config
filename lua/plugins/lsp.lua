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
      },

    filetypes = {"c", "cpp", "h", "cc", "hpp"},
    root_dir = require("lspconfig").util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
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
        
        -- Set up bash-specific keymaps
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end,
    })
  end,
} 
