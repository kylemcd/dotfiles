-- require("poimandres").setup({
-- 	disable_background = true,
-- })

function ColorMyPencils(color)
	color = color or "vesper"
	vim.cmd.colorscheme(color)
	vim.cmd("hi Comment  guifg=#4f4e4e")
	vim.cmd("hi Question  guifg=#4f4e4e")

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
