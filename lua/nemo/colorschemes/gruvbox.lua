local package = G.on_require("gruvbox")

package.setup {
  italic = false,
}

vim.opt.background = "dark"
vim.cmd("colorscheme gruvbox")
-- vim.cmd("let g:gruvbox_contrast_dark='soft'")
vim.cmd("highlight Normal guibg=none")
