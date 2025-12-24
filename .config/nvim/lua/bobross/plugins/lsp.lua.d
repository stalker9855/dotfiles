local root_files = {
	".luarc.json",
	".luarc.jsonc",
	".luacheckrc",
	".stylua.toml",
	"stylua.toml",
	"selene.toml",
	"selene.yml",
	".git",
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			config = function()
				vim.api.nvim_create_autocmd("BufWritePre", {
					pattern = "*",
					callback = function(args)
						require("conform").format({ bufnr = args.buf })
					end,
				})
			end,
		})
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		-- If you are using mason.nvim, you can get the ts_plugin_path like this
		-- For Mason v1,
		-- local mason_registry = require('mason-registry')
		-- local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'
		-- For Mason v2,
		-- local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'
		-- or even
		-- local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

		-- IMPORTANT: nvchad users cannot use `$MASON` directly as the option is set to `skip`, see: https://github.com/NvChad/NvChad/blob/29ebe31ea6a4edf351968c76a93285e6e108ea08/lua/nvchad/configs/mason.lua#L4

		local vue_language_server_path = ''
		local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
		local vue_plugin = {
			name = '@vue/typescript-plugin',
			location = vue_language_server_path,
			languages = { 'vue' },
			configNamespace = 'typescript',
		}

		local ts_ls_config = {
			init_options = {
				plugins = {
					vue_plugin,
				},
			},
			filetypes = tsserver_filetypes,
		}

		local vtsls_config = {
			settings = {
				vtsls = {
					tsserver = {
						globalPlugins = {
							vue_plugin,
						},
					},
				},
			},
			filetypes = tsserver_filetypes,
		}


		-- If you are on most recent `nvim-lspconfig`
		local vue_ls_config = {}
		-- If you are not on most recent `nvim-lspconfig` or you want to override
		-- nvim 0.11 or above
		vim.lsp.config('vtsls', vtsls_config)
		vim.lsp.config('vue_ls', vue_ls_config)
		vim.lsp.config('ts_ls', ts_ls_config)
		vim.lsp.enable({ 'vtsls', 'vue_ls' }) -- If using `ts_ls` replace `vtsls` to `ts_ls`




		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ruff",
				"pyright",
				"biome"
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})

					if server_name == 'ts_ls' then
						local mason_registry = require "mason-registry"
						local vue_language_server_path = mason_registry.get_package(
							    "vue-language-server"):get_install_path() ..
						    "/node_modules/@vue/language-server"

						servers.ts_ls.init_options.plugins[1].location = vue_language_server_path
					end
				end,

				zls = function()
					local lspconfig = require("lspconfig")
					lspconfig.zls.setup({
						root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
						settings = {
							zls = {
								enable_inlay_hints = true,
								enable_snippets = true,
								warn_style = true,
							},
						},
					})
					vim.g.zig_fmt_parse_errors = 1
					vim.g.zig_fmt_autosave = 0
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								format = {
									enable = true,
									-- Put format options here
									-- NOTE: the value should be STRING!!
									defaultConfig = {
										indent_style = "space",
										indent_size = "2",
									},
								},
							},
						},
					})
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
				["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
