return {
--Treesitter Plugin Setup
  {
    "nvim-treesitter/nvim-treesitter",
    ensure_installed = { "lua", "rust", "toml", "java" },
    auto_install = true,
    highlight = {
	    enable = true,
	    additional_vim_regex_highlighting=false,
    },
    ident = { enable = true },
    rainbow = {
	    enable = true,
	    extended_mode = true,
	    max_file_lines = nil,
    }
  }
}
