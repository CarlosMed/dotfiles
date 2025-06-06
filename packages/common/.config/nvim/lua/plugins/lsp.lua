return {
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    -- enable mason and configure icons
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          "prettierd", -- prettier formatter
          "stylua", -- lua formatter
          "eslint_d", -- js linter
          "goimports",
          "gofumpt",
          "gomodifytags",
          "gotests",
          "iferr",
          "impl",
          "templ",
        },
        auto_update = false,
        run_on_start = true,
        -- start_delay = 3000, -- 3 second delay
        -- debounce_hours = 5, -- at least 5 hours between attempts to install/update
      },
    },

    "williamboman/mason-lspconfig.nvim",

    -- Additional lua configuration, makes nvim stuff amazing!
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false },

    -- Useful status updates for LSP
    { "j-hui/fidget.nvim", tag = "legacy", opts = {}, event = "VeryLazy" },
  },

  config = function()
    -- [[ Configure LSP ]]
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })
      end

      -- local tele_builtin = require("telescope.builtin")

      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

      -- nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      -- nmap("gd", tele_builtin.lsp_definitions, "[G]oto [D]efinition")
      -- nmap("gr", tele_builtin.lsp_references, "[G]oto [R]eferences")
      -- nmap("gI", tele_builtin.lsp_implementations, "[G]oto [I]mplementation")
      -- nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
      -- nmap("<leader>ds", tele_builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
      -- nmap("<leader>ws", tele_builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

      -- See `:help K` for why this keymap
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")
      nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

      -- Lesser used LSP functionality
      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
      nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
      nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, "[W]orkspace [L]ist Folders")

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
      end, { desc = "Format current buffer with LSP" })
    end

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local servers = {
      bashls = {},
      custom_elements_ls = {},
      cssls = {},
      docker_compose_language_service = {},
      dockerls = {},
      -- emmet_language_server = {},
      emmet_ls = {},
      golangci_lint_ls = {},
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },
      },
      html = {
        filetypes = { "html", "twig", "hbs", "tsx", "templ" },
      },
      jsonls = {},
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
      marksman = {},
      sqlls = {},
      tailwindcss = {},
      volar = {
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
        settings = {
          typescript = {
            inlayHints = {
              enumMemberValues = {
                enabled = true,
              },
              functionLikeReturnTypes = {
                enabled = true,
              },
              propertyDeclarationTypes = {
                enabled = true,
              },
              parameterTypes = {
                enabled = true,
                suppressWhenArgumentMatchesName = true,
              },
              variableTypes = {
                enabled = true,
              },
            },
          },
        },
      },
      yamlls = {},
    }

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
      automatic_installation = true,
      ensure_installed = vim.tbl_keys(servers),
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        --[[ Fixes an issue loading tsserver, which is already loaded by typscript-tools.nvim ]]
        if server_name == "tsserver" then
          return
        end

        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        })
      end,
    })
  end,
}
