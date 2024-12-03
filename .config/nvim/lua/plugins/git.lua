return {
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
		opts = {
			default_mappings = {
				ours = "<leader>go",
				theirs = "<leader>gt",
				both = "<leader>gb",
			},
			highlights = {
				incoming = "FoldColumn",
				current = "WildMenu",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk_inline<CR>")
			vim.keymap.set("n", "<leader>gtb", ":Gitsigns toggle_current_line_blame<CR>")
		end,
	},
}
