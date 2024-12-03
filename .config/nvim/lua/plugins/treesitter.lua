return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "templ", "html", "javascript", "typescript", "java", "kotlin", "json", "yaml", "dockerfile" },
				ignore_install = {},
				sync_install = false,
				auto_install = true,
				modules = {},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false
				},
				indent = { enable = true }
			}
		end
	},
}
