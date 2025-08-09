vim.pack.add({
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/stevearc/dressing.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/kdheepak/lazygit.nvim" },
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
})

require "dressing".setup({})

require "fidget".setup({})

require "oil".setup({
  view_options = {
    show_hidden = true
  }
})

require "mini.pick".setup({
  mappings = {
    move_up = '<C-k>',
    move_down = '<C-j>',
  }
})

-- colors
vim.cmd("colorscheme tokyonight-night")
vim.cmd(":hi statusline guibg=NONE")
