function ColorMyPencils(color)
	color = color or "gruvbox-flat"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
vim.cmd('highlight SignColumn guibg=NONE') -- desativa background na barra de ícones
