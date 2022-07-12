local M = {}

local function getClassName()
    local rsl = ""
    local path = vim.fn.expand "%:p:r"
    local _, e = path:find "^.+/src/.+/java/"
    if e then
        rsl = path:sub(e + 1):gsub("/", ".")
    end
    return rsl
end

local function fillClipboard(s)
    vim.cmd(string.format('let @+ = "%s"', s))
end

local function executeClass()
  local className = getClassName()
  return string.format(':!mvn exec:java -Dexec.mainClass="%s"<cr>', className)
end

M.apply = function (bufnr)
  local jdtls = G.on_require("jdtls")
  if jdtls then
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- Normal mode keymaps
    vim.keymap.set("n", "<space>jo", jdtls.organize_imports, bufopts)
    vim.keymap.set("n", "<space>jv", jdtls.extract_variable, bufopts)
    vim.keymap.set("n", "<space>jc", jdtls.extract_constant, bufopts)
    vim.keymap.set("n", "<space>jt", jdtls.test_nearest_method, bufopts)
    vim.keymap.set("n", "<space>jT", jdtls.test_class, bufopts)
    vim.keymap.set("n", "<space>ju", jdtls.update_project_config, bufopts)
    vim.keymap.set("n", "<space>jR", ":JdtRefreshDebugConfigs<cr>", bufopts)
    vim.keymap.set("n", "<space>jn", function ()
      fillClipboard(getClassName())
    end, bufopts)
    vim.keymap.set("n", "<space>je", executeClass(), bufopts)
    -- Visual mode keymaps
    vim.keymap.set("v", "<space>jv", function ()
      jdtls.extract_variable(true)
    end, bufopts)
    vim.keymap.set("v", "<space>jc", function ()
      print("extracting a constant")
      jdtls.extract_constant(true)
    end, bufopts)
    vim.keymap.set("v", "<space>jm", function ()
      jdtls.extract_method(true)
    end, bufopts)
  end
end

return M
