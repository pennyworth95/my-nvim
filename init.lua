--nvim tree Setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "

--4 space tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

--lazy package manager
require("config.lazy")

--theme
vim.cmd("colorscheme kanagawa-wave")
--require('onedark').setup {
--	style = 'darker'
--	}
--require('onedark').load()
--vim.cmd("colorscheme onedark")


-- indent block lines
require("ibl").setup()

-- LSP Diagnostics Options Setup
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

-- diagnostic options
sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

	
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

vim.cmd([[
  set signcolumn=yes
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

--vimspector setup
vim.g.vimspector_base_dir='home/ellie/.local/share/nvim/lazy/vimspector'
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },})

vim.keymap.set('n', '<F5>',
	function() vim.cmd(":call vimspector#Launch()") end)
vim.keymap.set('n', '<F8>',
	function() vim.cmd(":call vimspector#Reset()") end)
vim.keymap.set('n', '<F9>',
	function() vim.cmd(":call vimspector#StepOver()") end)
vim.keymap.set('n', '<F10>',
	function() vim.cmd(":call vimspector#StepInto()") end)
vim.keymap.set('n', '<F11>',
	function() vim.cmd(":call vimspector#StepOver()") end)
vim.keymap.set('n', '<F12>',
	function() vim.cmd(":call vimspector#StepOut()") end)

vim.keymap.set('n', '<leader>bp',
	function() vim.cmd(":call vimspector#ToggleBreakpoint()") end)
vim.keymap.set('n', '<leader>wa',
	function() vim.cmd(":call vimspector#AddWatch()") end)
vim.keymap.set('n', '<leader>ev',
	function() vim.cmd(":call vimspector#Evaluate()") end)

-- FloaTerm config
vim.keymap.set('n', "<leader>ft",
	function() vim.cmd(":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish") end)
vim.keymap.set('n', "t",
	function() vim.cmd(":FloatermToggle myfloat") end)
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")
-- open nvimtree on file open
vim.cmd("NvimTreeOpen")
  
--telescope buffer search
local tsbuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fb',
  function() tsbuiltin.buffers({
    sort_mru=true,
    ignore_current_buffer=true
    }) end)
--telescope basic usage
vim.keymap.set('n', '<leader>ff', tsbuiltin.find_files)
vim.keymap.set('n', '<leader>fg', tsbuiltin.live_grep)
vim.keymap.set('n', '<leader>fh', tsbuiltin.help_tags)

-- Jump to the definition of the word under your cursor.
--  This is where a variable was first declared, or where a function is defined, etc.
--  To jump back, press <C-t>.
vim.keymap.set('n', '<leader>gd', tsbuiltin.lsp_definitions)

-- Find references for the word under your cursor.
vim.keymap.set('n', '<leader>gr', tsbuiltin.lsp_references)
-- Jump to the implementation of the word under your cursor.
--  Useful when your language has ways of declaring types without an actual implementation.
vim.keymap.set('n', '<leader>gI', tsbuiltin.lsp_implementations)

-- goto-preview config
require('goto-preview').setup {
	width = 120, -- Width of the floating window
	height = 15, -- Height of the floating window
	border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}, -- Border characters of the floating window
	default_mappings = true, -- Bind default mappings
	debug = false, -- Print debug information
	opacity = 25, -- 0-100 opacity level of the floating window where 100 is fully transparent.
	resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
	post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
	post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
	references = { -- Configure the telescope UI for slowing the references cycling window.
	telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
},
-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
    focus_on_open = true, -- Focus the floating window when opening it.
    dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
    force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
    bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
    stack_floating_preview_windows = true, -- Whether to nest floating windows
    preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
	zindex = 1, -- Starting zindex for the stack of floating windows
}

--vim.keymap.set('n', 'gpd',"<cmd> lua require('goto-preview').goto_preview_definition()<CR>")
--vim.keymap.set('n', 'gpt',"<cmd> lua require('goto-preview').goto_preview_type_definition()<CR>")
--vim.keymap.set('n', 'gpi',"<cmd> lua require('goto-preview').goto_preview_implementation()<CR>")
--vim.keymap.set('n', 'gpD',"<cmd> lua require('goto-preview').goto_preview_declaration()<CR>")
--vim.keymap.set('n', 'gP', "<cmd> lua require('goto-preview').close_all_win()<CR>")
--vim.keymap.set('n', 'gpr',"<cmd> lua require('goto-preview').goto_preview_references()<CR>")

--NvimTreeOpen
vim.keymap.set('n', '<leader>t', 
  function() vim.cmd("NvimTreeToggle") end)

--hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_words({ current_line_only = false })
  end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_patterns({ current_line_only = false })
  end, {remap=true})


