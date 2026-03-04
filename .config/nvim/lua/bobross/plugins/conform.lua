return {
	"stevearc/conform.nvim",
	opts = {},
	event = "BufWritePre",
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 1000,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettier", stop_after_first = true },
			},
		})
	end,
}
