return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.keymap.set('n', '<S-l>', '<Cmd>:BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<S-h>', '<Cmd>:BufferLineCyclePrev<CR>')
  end,
}
