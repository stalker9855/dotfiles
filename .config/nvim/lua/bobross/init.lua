vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("bobross.lazy_init")
vim.o.number = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.signcolumn = "yes"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.laststatus = 3
vim.o.confirm = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.termguicolors = true
vim.opt.guicursor = ""
-- vim.opt.pumblend = 0

vim.g.netrw_banner = 1
vim.g.netrw_liststyle = 0

vim.opt.path:append("**")

vim.opt.tabstop = 4
vim.opt.fillchars = { eob = " " }

vim.opt.updatetime = 50

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- yank
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- nvimtree
vim.keymap.set("n", "<leader>ee", "<CMD>Ex<CR>")

-- find and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>")
-- barbar
-- vim.keymap.set("n", "<leader>x", "<cmd>BufferClose<CR>")
--

vim.keymap.set("n", "<leader>n", "<cmd>bnext<cr>")
vim.keymap.set("n", "<leader>p", "<cmd>bprevious<cr>")
-- vim.keymap.set("n", "<leader>x", "<cmd>bd<cr>")

-- lsp
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

vim.keymap.set("n", "<leader>xx", function ()
		vim.diagnostic.setqflist(
				{
						severity = { min = vim.diagnostic.severity.WARN }
				}
		)
end)

vim.api.nvim_create_autocmd("DiagnosticChanged", {
		callback = function()
				vim.diagnostic.setqflist({
						open = false,
						severity = {}
				})
		end
})


vim.keymap.set("n", "<leader>xc", "<cmd>cclose<CR>")
vim.keymap.set("n", "<A-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<A-k>", "<cmd>cprevious<CR>")

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("tab:→ ")



local vue_language_server_path = vim.fn.stdpath("data")
.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"


local vue_plugin = {
		name = "@vue/typescript-plugin",
		location = vue_language_server_path,
		languages = { "vue" },
		configNamespace = "typescript",
}
vim.lsp.config("vtsls", {
		settings = {
				vtsls = {
						tsserver = {
								globalPlugins = {
										vue_plugin,
								},
						},
				},
		},
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

vim.lsp.enable("vue_ls")
vim.lsp.enable("vtsls")

vim.filetype.add({
		extension ={
				jinja = "jinja.html",
				jinja2 = "jinja.html",
				j2 = "jinja.html",
		}
})


vim.lsp.config("tailwindcss", {
  filetypes = { "html", "jinja.html", "jinja", "htmldjango", "vue" },
  init_options = {
    userLanguages = {
      jinja = "html",
      jinja2 = "html",
    },
  },
})

vim.lsp.config("emmet_ls", {
  filetypes = { "html", "jinja.html", "jinja", "htmldjango", "css", "scss" },
})

vim.lsp.config("html", {
  filetypes = { "html", "jinja.html", "jinja" },
})

