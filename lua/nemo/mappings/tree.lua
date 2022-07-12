local M = {}

M.apply = function ()
  G.on_require("nvim-tree", function ()
    local opts = { noremap = true }
      -- tt -> tree toggle
      vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<cr>", opts)
      -- tfo -> tree find when opened
      vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFile<cr>", opts)
      -- tft -> tree find when closed
      -- tF -> tree focus
      vim.keymap.set("n", "<leader>tF", "<cmd>NvimTreeFocus<cr>", opts)
  end)
end

return M
