local autopairs = G.on_require("nvim-autopairs")
if not autopairs then
 return
end

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp = require "cmp"
cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done()
)

autopairs.setup {
  map_c_h = true,
}

