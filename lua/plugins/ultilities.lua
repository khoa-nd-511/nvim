vim.pack.add({
  { src = 'https://github.com/echasnovski/mini.pick' },
  { src = 'https://github.com/j-hui/fidget.nvim' },
  { src = 'https://github.com/stevearc/dressing.nvim' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/folke/tokyonight.nvim' },
  { src = 'https://github.com/kdheepak/lazygit.nvim' },
  { src = 'https://github.com/christoomey/vim-tmux-navigator' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/akinsho/bufferline.nvim' },
})

require 'dressing'.setup {}
require 'fidget'.setup {}
require 'nvim-autopairs'.setup {}
require 'bufferline'.setup {
  options = {
    separator_style = 'slant'
  }
}

require 'oil'.setup {
  view_options = {
    show_hidden = true
  }
}

require 'mini.pick'.setup {
  mappings = {
    move_up = '<C-k>',
    move_down = '<C-j>',
  }
}

require 'gitsigns'.setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local map = function(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Blame current line
    map('n', '<leader>hb', function()
      gs.blame_line({ full = true })
    end)

    -- Blame whole file
    map('n', '<leader>hf', function()
      gs.blame({ full = true })
    end)
  end
}

-- colors
vim.cmd('colorscheme tokyonight-night')
vim.cmd(':hi statusline guibg=NONE')
