local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			'marko-cerovac/material.nvim',
			priority = 1000,
			init = function()
				vim.g.material_style = 'darker'
				-- vim.cmd('colorscheme material')
			end,
		},
		{
			'ellisonleao/gruvbox.nvim',
			config = function()
				vim.cmd('colorscheme gruvbox')
			end,
		},
		{
			'nvim-treesitter/nvim-treesitter',
			config = function()
				require('nvim-treesitter.configs').setup({
					ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
					auto_install = true,
					highlight = {
						enable = true,
					},
				})
			end,
		},
		{
			'neovim/nvim-lspconfig',
			config = function()
				local lspconfig = require('lspconfig')
				lspconfig.clangd.setup({})
				lspconfig.lua_ls.setup({})
			end,
		},
		{
			'akinsho/flutter-tools.nvim',
			lazy = false,
			dependencies = {
				'nvim-lua/plenary.nvim',
				'stevearc/dressing.nvim', -- optional for vim.ui.select
			},
			config = function()
				require("flutter-tools").setup({})
			end,
		},
		-- init.lua:
		{
			'nvim-telescope/telescope.nvim',
			dependencies = { 'nvim-lua/plenary.nvim' },
			config = function()
				local builtin = require('telescope.builtin')
				vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
				vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
				vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
				vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
				require('telescope').setup {
					-- You can put your default mappings / updates / etc. in here
					--  All the info you're looking for is in `:help telescope.setup()`
					--
					-- defaults = {
						--   mappings = {
							--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
							--   },
							-- },
							-- pickers = {}
							extensions = {
								['ui-select'] = {
									require('telescope.themes').get_dropdown(),
								},
							},
						}
			end,
		}
	},
	checker = { enabled = true },
})

