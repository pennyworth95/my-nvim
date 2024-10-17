
return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function ()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"williamboman/mason.nvim"
	},
	{
		"williamboman/mason-lspconfig.nvim"
	}
}

