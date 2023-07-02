-- import fidget plugin safely
local setup, fidget = pcall(require, "fidget")
if not setup then
	return
end

-- configure/enable fidget
fidget.setup({
	window = {
		blend = 0,
	},
	text = {
		spinner = { "🏎️" },
		done = "🏁",
	},
	fmt = {
		-- function to format each task line
		task = function()
			return nil
		end,
	},
})
