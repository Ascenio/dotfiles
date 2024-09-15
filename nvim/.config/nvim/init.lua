require('keymaps')
require('options')
require('plugins')

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-autogroup', { clear = true }),
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

		vim.api.nvim_create_autocmd('BufWritePre', {
			buffer = opts.buf,
			group = vim.api.nvim_create_augroup('formatter', { clear = true }),
			callback = function() vim.lsp.buf.format() end,
		})
	end,
})

-- FIXME
vim.api.nvim_create_autocmd('BufWritePost', {
	desc = 'reload config',
	group = vim.api.nvim_create_augroup('reload-config', { clear = true }),
	pattern = vim.fn.stdpath('config') .. '/**/*.lua',
	callback = function()
		vim.cmd('source')
	end,
})
