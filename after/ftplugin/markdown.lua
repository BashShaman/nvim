local opts = {
  tabstop = 4,
  shiftwidth = 0,
  softtabstop = -1,
  expandtab = true,
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end

