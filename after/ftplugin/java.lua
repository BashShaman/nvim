local opts = {
	tabstop = 4,
	shiftwidth = 0,
	softtabstop = -1,
	expandtab = true,
}

for k, v in pairs(opts) do
	vim.opt[k] = v
end

local on_success = function(jdtls)
	local paths = {
		java = os.getenv("JAVA_HOME") .. "bin/java",
		jdtls = os.getenv("JDTLS_HOME"),
		workspace = os.getenv("HOME") .. "/.workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
		sources = os.getenv("HOME") .. "/Sources/",
	}

	local apply_mappings = function(bufnr)
		local names = { "lsp", "java", "dap" }
		for _, name in ipairs(names) do
			local mappings = require(string.format("nemo.mappings.%s", name))
			mappings.apply(bufnr)
		end
	end

	local setup_addons = function(client)
		-- local names = { "nvim-dap-virtual-text", "dapui" }
		-- G.fn.foreach(names, function(name)
		-- 	G.on_require(name, function(package)
		-- 		package.setup()
		-- 	end)
		-- end)
		G.on_require("illuminate", function(package)
			package.on_attach(client)
		end)
	end

	local on_attach = function(client, bufnr)
		jdtls.setup_dap({ hotcodereplace = "auto" })
		apply_mappings(bufnr)
		require("jdtls.setup").add_commands()
		setup_addons(client)
	end

	local capabilities = (function(capabilities)
		return G.on_require("cmp_nvim_lsp", function(plugin)
			return plugin.update_capabilities(capabilities)
		end, function()
			return capabilities
		end)
	end)(vim.lsp.protocol.make_client_capabilities())

	capabilities.textDocument.completion.completionItem.snippetSupport = false
	local extendedClientCapabilities = jdtls.extendedClientCapabilities
	extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

	local config = {
		-- The command that starts the language server
		-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
		cmd = {
			--   Set the version of Java you need
			paths.java,
			--   Do not really understand the meaning of these options
			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			"-Dosgi.bundles.defaultStartLevel=4",
			"-Declipse.product=org.eclipse.jdt.ls.core.product",
			"-Dlog.protocol=true",
			"-Dlog.level=ALL",
			"-Xms1g",
			"--add-modules=ALL-SYSTEM",
			"--add-opens",
			"java.base/java.util=ALL-UNNAMED",
			"--add-opens",
			"java.base/java.lang=ALL-UNNAMED",
			-- 
			"-jar",
			paths.jdtls .. "plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
			-- 
			"-configuration",
			paths.jdtls .. "config_linux",
			-- 
			"-data",
			paths.workspace,
		},

		-- 
		-- This is the default if not provided, you can remove it. Or adjust as needed.
		-- One dedicated LSP server & client will be started per unique root_dir
		root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

		-- Here you can configure eclipse.jdt.ls specific settings
		-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
		-- for a list of options
		settings = {
			java = {},
		},

		-- Language server `initializationOptions`
		-- You need to extend the `bundles` with paths to jar files
		-- if you want to use additional eclipse.jdt.ls plugins.
		--
		-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
		--
		-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = require("nemo.plugins.lspconfig.handlers"),
	}

	local bundles = {
		vim.fn.glob(
			paths.sources .. "java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
		),
	}
	local path = paths.sources .. "vscode-java-test/server/*.jar"
	local path_list = vim.split(vim.fn.glob(path), "\n")
	vim.list_extend(bundles, path_list)

	config.init_options = {
		extendedClientCapabilities = extendedClientCapabilities,
		bundles = bundles,
	}

	jdtls.start_or_attach(config)
end

G.on_require("jdtls", on_success)
