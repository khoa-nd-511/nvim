vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

require "nvim-treesitter.configs".setup({
  modules = {},
  sync_install = false,
  ignore_install = {},
  auto_install = false,
  ensure_installed = {
    "typescript", "javascript"
  },
  highlight = { enable = true }
})
