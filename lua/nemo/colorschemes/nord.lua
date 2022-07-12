local ok, result = pcall(require, 'nord')
if not ok then
  return
end

local opts = {
  nord_contrast = true,
  nord_borders = true,
  nord_italic = false,
}

for k, v in pairs(opts) do
  vim.g[k] = v
end

result.set()
