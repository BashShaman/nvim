local M = {}

M.apply = function (bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', '<leader>lr', (function ()
    local action = vim.lsp.buf.rename
    local ok, saga_rename = pcall(require, "lspsaga.rename")
    if ok then
      action = saga_rename.lsp_rename
    end
    return action
  end)(), opts)
  vim.keymap.set('n', '<leader>lR', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, opts)
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>lk', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>lK', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, opts)
  -- I don't fully understand these mappings
  vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>lwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
end

return M
