return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ib1"
    ---@type ibl.config
    opts = {}
  },
  {
    "windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true
  },
  {
    "tpope/vim-surround"
  },
  {
    "RRethy/vim-illuminate"
  },
  {
    "numToStr/Comment.nvim"
  }
}
