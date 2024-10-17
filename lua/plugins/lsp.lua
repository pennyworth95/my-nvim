-- Mason Setup
return {
  {

    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
  
    config = function()
      local mlspconfig = require("mason-lspconfig")
      local mason = require("mason")
  
      mason.setup({
        ui = {
          icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
          },
        }
      })
  
      mlspconfig.setup()
    end,
  },
  
-- nvim-lspconfig
  {
    "neovim/nvim-lspconfig"
  },

-- java stuff
  {
	  'mfussenegger/nvim-jdtls'
  },

-- rust stuff
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            --Hover actions
	    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
	    --Code action groups
	    vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
	},
      })
    end,
  }
}
