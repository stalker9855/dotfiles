return {
  {
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
    },
    config = function()
      require('auto-session').setup({
          auto_restore_enabled = true,
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      })
    vim.keymap.set("n", "<leader>wr", "<Cmd>SessionRestore<CR>")
    vim.keymap.set("n", "<leader>ws", "<Cmd>SessionSave<CR>")
    end,
  },
}
