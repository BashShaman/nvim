local function isBufEmpty()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
  return #lines == 1 and lines[1]:len() == 0
end

local function isProject()
  local rsl = false
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":p")
  for line in assert(io.popen("ls " .. cwd)):lines() do
    if line:match("pom.xml") then
      rsl = true
      break
    end
  end
  return rsl
end

local function includePackage()
  if isProject() and isBufEmpty() then
    local path = vim.fn.expand "%:p:h"
    local _, e = path:find "^.+/src/.+/java/"
    if e then
      local package = "package " .. path:sub(e + 1):gsub("/", ".") .. ";"
      vim.api.nvim_buf_set_lines(0, 0, 1, true, {
        package,
        "",
        "public class " .. vim.fn.expand "%:t:r" .. " {",
        "}",
      })
      vim.api.nvim_win_set_cursor(0, { 3, 0 })
    end
  end
end

local groups = (function()
  local map = {}
  for _, name in ipairs { "java" } do
    map[name] = vim.api.nvim_create_augroup(name, { clear = true })
  end
  return map
end)()

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "java" },
  callback = function()
    vim.schedule(includePackage)
  end,
  group = groups.java,
})

--
-- vim.api.nvim_create_autocmd("FileType", {
-- 	command = "setlocal wrap",
-- 	group = groups.qf,
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "lua" },
-- 	callback = function()
-- 		vim.schedule(function()
-- 			local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
-- 			if #lines == 1 and string.len(lines[1]) == 0 then
-- 				vim.api.nvim_buf_set_lines(0, 0, 0, false, { "#!/usr/bin/env luajit" })
-- 			end
-- 		end)
-- 	end,
-- 	group = groups.lua,
-- })
--
--
-- vim.cmd([[
--   augroup type_all
--     autocmd BufWinEnter *.* silent! loadview
--     autocmd BufWinLeave *.* mkview
--   augroup END
-- ]])
