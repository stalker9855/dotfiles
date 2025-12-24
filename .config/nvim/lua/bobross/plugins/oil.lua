return {
	"stevearc/oil.nvim",
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	config = function()
		require("oil").setup({
			columns = {
				"icon",
			},
		})
	end,
}
