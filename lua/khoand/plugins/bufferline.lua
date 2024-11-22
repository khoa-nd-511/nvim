return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			separator_style = "slant",
		},
	},
	config = function()
		require("bufferline").setup()
		vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<CR>")
		vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<CR>")
		vim.keymap.set("n", "<leader>bw", "<cmd>BufferLineCloseOthers<CR>")
	end,
}
