-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<C-n>', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    window = {
      position = 'right',
      width = 60,
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
        visible = true,
      },
      window = {
        mappings = {
          ['<C-n>'] = 'close_window',
          ['l'] = 'open',
        },
      },
    },
  },
}
