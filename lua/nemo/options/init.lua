local opt = vim.opt

local opts = {
	cursorline = true,
	scrolloff = 3,
	number = true,
	relativenumber = true,
	incsearch = false,
	wrap = false,
	path = opt.path + { "**" },
	omnifunc = "syntaxcomplete#Complete",
	termguicolors = true,
	signcolumn = "yes",
	mouse = "a",
	iskeyword = opt.iskeyword + { "-" },
	whichwrap = opt.whichwrap + {
		["["] = true,
		["]"] = true,
		["<"] = true,
		[">"] = true,
	},
	pumheight = 10,
	showmode = false,
	list = true,
	-- listchars = vim.opt.listchars + {
	--   eol = "↲", space = "·", tab = "▸ "
	-- },
	shiftround = true,
	hlsearch = false,
	tabstop = 4,
	shiftwidth = 0,
	softtabstop = -1,
	laststatus = 0,
	wildignorecase = true,
	wildignore = ".git/*,*.class",
}

opt.listchars:append({ eol = "↲" })
opt.listchars:append({ tab = "▸ " })

for k, v in pairs(opts) do
	opt[k] = v
end
