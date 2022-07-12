local on_success = function (illuminate)
  local opts = { noremap = true, silent = true }

  vim.keymap.set('n', '<a-n>', function ()
    illuminate.next_reference({wrap=true})
  end, opts)

  vim.keymap.set('n', '<a-p>', function ()
    illuminate.next_reference({reverse=true, wrap=true})
  end, opts)
end

G.on_require("illuminate", on_success)
