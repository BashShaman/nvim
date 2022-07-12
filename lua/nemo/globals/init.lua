G = {}

G._stdout = os.getenv("HOME") .. "/Logs/nvim.txt"

G.empty = function(table)
	return next(table) == nil
end

G.notempty = function(table)
	return not G.empty(table)
end

-- inspect a table
G.i = function(table)
	local rsl = vim.inspect(table)
	print(rsl)
end

-- reload a module
G.r = function(name)
	package.loaded[name] = nil
	return require(name)
end

-- reload all modules
G.ra = function(...)
	local args = { ... }
	for _, name in ipairs(args) do
		G.r(name)
	end
end

G.clear = function()
	local fp = io.open(G._stdout, "w")
	if fp ~= nil then
		fp:close()
		print("Log is empty.")
	end
end

G.log = function(message)
	local fp = io.open(G._stdout, "a")
	if fp ~= nil then
		fp:write([[LOG: ]] .. os.date() .. "\n")
		fp:write(message)
		fp:write("\n\n")
		fp:close()
	end
end

G.fn = {}

G.fn.reduce = function(list, callback, start)
	local total = start
	for index, value in ipairs(list) do
		total = callback(total, value, index, list)
	end
	return total
end

G.fn.map = function(list, callback)
	local rsl = {}
	for index, value in ipairs(list) do
		table.insert(rsl, callback(value, index, list))
	end
	return rsl
end

G.fn.filter = function(list, callback)
	local rsl = {}
	for index, value in ipairs(list) do
		if callback(value, index, list) then
			table.insert(rsl, value)
		end
	end
	return rsl
end

G.fn.foreach = function(list, callback)
	for index, value in ipairs(list) do
		callback(value, index, list)
	end
end

G.fn.zip = function(list1, list2)
	local rsl = {}
	if not G.empty(list1) and not G.empty(list2) then
		local index = 0
		while next(list1, index) ~= nil and next(list2, index) ~= nil do
			index = index + 1
			table.insert(rsl, { list1[index], list2[index] })
		end
	end
	return rsl
end

G.er = {}

G.er.require = function(name)
	print(string.format("Error: cannot require '%s'", name))
end

G.on_require = function(name, on_success, on_error)
	local rsl = nil
	local ok, plugin = pcall(require, name)
	if ok then
		if not on_success then
			rsl = plugin
		else
			local callback = on_success
			local args = {}
			if type(on_success) == "table" then
				callback = on_success[1]
				args = not on_success[2] and {} or on_success[2]
			end
			rsl = callback(plugin, unpack(args))
		end
	else
		if not on_error then
			G.er.require(name)
		else
			local callback = on_error
			local args = {}
			if type(on_error) == "table" then
				callback = on_error[1]
				args = not on_error[2] and {} or on_success[2]
			end
			rsl = callback(plugin, unpack(args))
		end
	end
	return rsl
end
