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

-- barbar
-- vim.keymap.set("n", "<Tab>", "<cmd>BufferNext<CR>")
-- vim.keymap.set("n", "<S-Tab>", "<cmd>BufferPrevious<CR>")
-- vim.keymap.set("n", "<leader>x", "<cmd>BufferClose<CR>")
--

vim.keymap.set("n", "<leader>n", "<cmd>bnext<cr>")
vim.keymap.set("n", "<leader>p", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<leader>x", "<cmd>bd<cr>")

-- lsp
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

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

local lspconfig = require("lspconfig")

lspconfig.tailwindcss.setup({
  filetypes = { "html", "jinja.html", "jinja", "htmldjango", "vue" },
  init_options = {
    userLanguages = {
      jinja = "html",
      jinja2 = "html",
    },
  },
})

lspconfig.emmet_ls.setup({
  filetypes = { "html", "jinja.html", "jinja", "htmldjango", "css", "scss" },
})

lspconfig.html.setup({
  filetypes = { "html", "jinja.html", "jinja" },
})
