local opts = { noremap = true }

-- Setting leadrers
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Ev -> edit vimrc
vim.keymap.set("n",
  "<leader>Ev",
  "<cmd>vsplit $MYVIMRC<cr><c-w>9>",
  opts)
-- En -> edit notes
vim.keymap.set("n",
  "<leader>En",
  "<cmd>vsplit $MYNOTES<cr><c-w>9>",
  opts)

-- Fc -> find config
vim.keymap.set("n",
  "<leader>Fc",
  ":find ~/.config/**/*",
  opts)
-- Fv -> find vimrc
vim.keymap.set("n",
  "<leader>Fv",
  ":find ~/.config/nvim/**/*",
  opts)
-- Fn -> find notes
vim.keymap.set("n",
  "<leader>Fn",
  ":find ~/Notes/**/*",
  opts)
-- Fn -> find home
vim.keymap.set("n",
  "<leader>Fh",
  ":find ~/**/*",
  opts)
-- Fl -> find labs
vim.keymap.set("n",
  "<leader>Fl",
  ":find ~/Labs/**/*",
  opts)
-- Ff -> (f)ind (f)iles
vim.keymap.set("",
  "<leader>Ff",
  ":find ./**/*",
  opts)
-- Ff -> (f)ind (m)aps
vim.keymap.set("",
  "<leader>Fm",
  ":find ~/.config/nvim/lua/nemo/mappings/*",
  opts)

-- da -> display all
vim.keymap.set("n",
  "<leader>da",
  ":argadd <c-r>=expand('%:p:h')<cr>/*<c-d>",
  opts)
-- db -> display buffer
vim.keymap.set("n",
  "<leader>db",
  ":b <c-d>",
  opts)

vim.keymap.set("c",
  "/",
  function()
    return vim.fn.wildmenumode() == 1 and "<c-y>" or "/"
  end,
  { expr = true, noremap = true })

-- TODO rethinks this function to really source init.lua
-- and check if all modules are really reloaded
vim.keymap.set("n", "<leader>sv", function ()
  print("Reloading plugins.")
  for index, _ in pairs(package.loaded) do
    if string.match(index, "^nemo") then
      G.r(index)
    end
  end
end, opts)

-- "x" for execute
vim.keymap.set("n",
  "<leader><leader>x",
  "<cmd>w<cr><cmd>source %<cr>")

-- "c" for clear
vim.keymap.set("n", "<leader><leader>c", function ()
  G.clear()
end)

-- Quicklist
vim.keymap.set("n", "<C-j>", "<cmd>cnext<cr>", opts)
vim.keymap.set("n", "<C-k>", "<cmd>cprevious<cr>", opts)

-- Neovim related
vim.keymap.set("n", "<leader><leader>t", "<plug>PlenaryTestFile")

-- Playing
-- Surround a word under the cursor or selected text
vim.keymap.set("n", [[<leader>"]],
  [[viwA"<esc>bi"<esc>el]], opts)
vim.keymap.set("n", [[<leader>']],
  [[viwA'<esc>bi'<esc>el]], opts)
vim.keymap.set("v", [[<leader>']],
  [[<esc>`<i'<esc>`>la'<esc>]])
vim.keymap.set("v", [[<leader>"]],
  [[<esc>`<i"<esc>`>la"<esc>]])

-- No arrows in `normal` mode
vim.keymap.set("n", "<left>", "<nop>", opts)
vim.keymap.set("n", "<up>", "<nop>", opts)
vim.keymap.set("n", "<down>", "<nop>", opts)
vim.keymap.set("n", "<right>", "<nop>", opts)

-- No arrows in `insert` mode
vim.keymap.set("i", "<left>", "<nop>", opts)
vim.keymap.set("i", "<up>", "<nop>", opts)
vim.keymap.set("i", "<down>", "<nop>", opts)
vim.keymap.set("i", "<right>", "<nop>", opts)

