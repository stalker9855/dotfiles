return {
	"numToStr/Comment.nvim",
	opts = {
		-- add any options here
	},
	config = function()
		require("Comment").setup({
			ignore = "^$",
			toggler = {
				line = "<leader>/",
				block = "<leader>.",
			},
			opleader = {
				line = "<leader>/",
				block = "<leader>.",
			},
		})
	end,
}
