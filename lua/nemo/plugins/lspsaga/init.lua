local ok, saga = pcall(require, "lspsaga")
if not ok then
  print([[Error: unable to require 'lspsaga'.]])
  return
end

-- code action
local action = require("lspsaga.codeaction")
local opts = { silent = true, noremap = true  }
pcall(vim.keymap.del, "n", "<leader>la")
pcall(vim.keymap.del, "v", "<leader>la")
vim.keymap.set("n", "<leader>ca", action.code_action, opts)
vim.keymap.set("v", "<leader>ca", function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    action.range_code_action()
end, opts)

saga.init_lsp_saga({
  code_action_icon = "",
})
