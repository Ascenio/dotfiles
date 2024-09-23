return {
	'marko-cerovac/material.nvim',
	priority = 1000,
	init = function()
		vim.g.material_style = 'darker'
		-- vim.cmd('colorscheme material')
	end,
}
