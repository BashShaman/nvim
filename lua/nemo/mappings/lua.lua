local M = {}

M.apply = function (bufnr)
  local on_success = function (osv)
    local opts = { noremap = true, silent = true, bufnr = bufnr }
    -- dR -> (d)ap (r)un
    vim.keymap.set('n', '<leader>dR', osv.run_this, opts)
  end
  G.on_require("osv", on_success)
end

return M
