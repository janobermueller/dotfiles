local options = {
	number = true,
	relativenumber = true,

	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	smartindent = true,

	cursorline = true,
	wrap = true,

	ignorecase = true,
	smartcase = true,

	backup = false,
	swapfile = false,
	undofile = true,
	undodir = os.getenv("XDG_STATE_HOME") .. "/nvim/undo",

	termguicolors = true,

	scrolloff = 8,
	colorcolumn = "80",
	signcolumn = "yes",

	updatetime = 250,

	splitright = true,
	splitbelow = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
