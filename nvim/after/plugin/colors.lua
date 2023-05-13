require("poimandres").setup({
	disable_background = true,
})

function ColorMyPencils(color)
	color = color or "poimandres"
	vim.cmd.colorscheme(color)
	vim.cmd("hi Comment  guifg=#FFFAC2")
	vim.cmd("hi Question  guifg=#506477")

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
