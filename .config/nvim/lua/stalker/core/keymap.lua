local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
-- map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>e', '<Cmd>NvimTreeFindFileToggle<CR>', { desc = "Open tree with current file"})
map('n', '<leader>c', '<Cmd>NvimTreeCollapse<CR>', {desc = "Collapse all folders"})


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = "Copy"})
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = "Copy the line"})


vim.keymap.set({'n', 'v'}, 'y', '"+y')
vim.keymap.set({'n', 'v'}, 'Y', '"+Y')

vim.keymap.set({'n', 'v'}, 'd', '"+d')
vim.keymap.set({'n', 'v'}, 'D', '"+D')

vim.keymap.set({'n', 'v'}, 'p', '"+p')
vim.keymap.set({'n', 'v'}, 'P', '"+P')


vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")
vim.keymap.set("n", "<leader>sx", "<Cmd>close<CR>")


vim.keymap.set("n", "<leader>x", "<Cmd>tabclose<CR>", { desc = "Close current tab"})
vim.keymap.set("n", "<leader>n", "<Cmd>tabnew %<CR>", { desc = "Create new tab"})
-- vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Go to next tab"})
-- vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous tab"})
vim.keymap.set("n", "<Tab>", "<Cmd>tabn<CR>", { desc = "Go to next tab"})
vim.keymap.set("n", "<S-Tab>", "<Cmd>tabp<CR>", { desc = "Go to previous tab"})

vim.keymap.set("i", "kj", "<Esc>")
