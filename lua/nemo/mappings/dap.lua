local M = {}

M.apply = function(bufnr)
  local dap = G.on_require("dap")
  if dap then
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- `db` -> Dap toggle Breakpoint
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, bufopts)
    -- `dB` -> Dap set conditional Breakpoint
    vim.keymap.set('n', '<leader>dB', function ()
      dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end, bufopts)
    -- `dc` -> Dap Continue
    vim.keymap.set('n', '<leader>dc', dap.continue, bufopts)
    -- `di` -> Dap step Into
    vim.keymap.set('n', '<leader>di', dap.step_into, bufopts)
    -- `do` -> Dap step Over
    vim.keymap.set('n', '<leader>do', dap.step_over, bufopts)
    -- `dO` -> Dap step Out
    vim.keymap.set('n', '<leader>dO', dap.step_out, bufopts)
    -- `dr` -> Dap toggle Repl
    vim.keymap.set('n', '<leader>dr', dap.repl.toggle, bufopts)
    -- `dl` -> Dap run Last
    vim.keymap.set('n', '<leader>dl', dap.run_last, bufopts)
    -- `du` -> Dap Ui toggle
    -- G.on_require("dapui", function (dapui)
    --   vim.keymap.set('n', '<leader>du', dapui.toggle, bufopts)
    -- end)
    -- `dx` -> Dap eXit
    vim.keymap.set('n', '<leader>dx', dap.terminate, bufopts)
  end
end

return M
