local opts = {
	tabstop = 2,
	shiftwidth = 0,
	softtabstop = -1,
	expandtab = true,
}

for k, v in pairs(opts) do
	vim.opt[k] = v
end

G.on_require("dap", function(dap)
	dap.configurations.lua = {
		{
			type = "nlua",
			request = "attach",
			name = "Attach to running Neovim instance",
			host = function()
				local value = vim.fn.input("Host [127.0.0.1]: ")
				if value ~= "" then
					return value
				end
				return "127.0.0.1"
			end,
			port = function()
				local val = tonumber(vim.fn.input("Port: "))
				assert(val, "Please provide a port number")
				return val
			end,
		},
	}

	dap.adapters.nlua = function(callback, config)
		callback({ type = "server", host = config.host, port = config.port })
	end

	vim.opt_local.makeprg = "LUA_INIT=@$HOME/Labs/lua/utils.lua luajit %"
end)
