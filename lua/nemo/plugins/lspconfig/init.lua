local function on_success(lspconfig)
  require "nemo.plugins.lspconfig.ui"

  local setup_addons = function(client)
    G.on_require "nvim-dap-virtual-text"
    G.on_require "dapui"
    G.on_require("illuminate", function(illuminate)
      illuminate.on_attach(client)
    end)
  end

  local on_attach = function(client, bufnr)
    require("nemo.mappings.lsp").apply(bufnr)
    require("nemo.mappings.dap").apply(bufnr)
    setup_addons(client)
  end

  local capabilities = (function(capabilities)
    return G.on_require("cmp_nvim_lsp", function(plugin)
      return plugin.update_capabilities(capabilities)
    end, function()
      return capabilities
    end)
  end)(vim.lsp.protocol.make_client_capabilities())

  -- local handlers = require("nemo.plugins.lspconfig.handlers")

  lspconfig.sumneko_lua.setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      require("nemo.mappings.lua").apply(bufnr)
    end,
    capabilities = capabilities,
    -- handlers = handlers,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }

  lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    -- handlers = handlers,
  }

  lspconfig.tsserver.setup {}
end

G.on_require("lspconfig", on_success)
