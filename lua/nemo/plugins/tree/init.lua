G.on_require("nvim-tree", function (tree)
  tree.setup {
    disable_netrw = true,
    view = {
      adaptive_size = true,
    },
    renderer = {
      group_empty = true,
    },
  }
end)
