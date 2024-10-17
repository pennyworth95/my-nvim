return {
  {
	"rmagatti/goto-preview",
	event = "BufEnter",
	config = true,
  },
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "smoka7/hop.nvim",
    version="*",
    opts = {
      keys = 'etovxqpdygfblzhckisuran'
    }
  }
}
