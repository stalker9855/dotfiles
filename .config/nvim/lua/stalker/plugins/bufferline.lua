return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            mode = "tabs",
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
        offsets = {
            filetype = 'NvimTree'
        }
        }
    }
}
