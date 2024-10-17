return {
  {
    "kyazdani42/nvim-tree.lua",
  },
  {
    "preservim/tagbar"
  },
  {
    "folke/todo-comments.nvim"
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
	"<leader>xx",
	"<cmd>Trouble diagnostics toggle<cr>",
	desc = "Diagnostics (Trouble)",
      },
      {
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	desc = "Buffer Diagnostics (Trouble)",
      },
      {
	"<leader>cs",
	"<cmd>Trouble symbols toggle focus=false<cr>",
	desc = "Symbols (Trouble)",
      },
      {
	"<leader>c1",
	"<cmd>Trouble lsp toggle focus=false win.position=r<cr>",
	desc = "LSP Definitions / references / ...(Trouble)",
      },
      {
	"<leader>xL",
	"<cmd>Trouble loclist toggle<cr>",
	desc = "Location List (Trouble)",
      },
      {
	"<leader>xQ",
	"<cmd>Trouble qflist toggle<cr>",
	desc = "Quickfix List (Trouble)",
      },
    }
  },
}

