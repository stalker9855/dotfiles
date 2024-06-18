return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
	      require("telescope").setup({})

	      local builtin = require('telescope.builtin')
	      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      end
    }
