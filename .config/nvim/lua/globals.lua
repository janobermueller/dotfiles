local globals = {
	--clipboard = "wl-clipboard",
	loaded_python3_provider = 0,
	loaded_ruby_provider = 0,
	loaded_node_provider = 0,
	loaded_perl_provider = 0,
	have_nerd_font = false
}

for k, v in pairs(globals) do
	vim.g[k] = v
end
