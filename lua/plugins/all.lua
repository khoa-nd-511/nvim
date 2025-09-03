vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/stevearc/dressing.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/kdheepak/lazygit.nvim" },
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mfussenegger/nvim-lint" },
  { src = "https://github.com/github/copilot.vim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next,     -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
})

require("dressing").setup({})
require("fidget").setup({})
require("nvim-autopairs").setup({})
require("bufferline").setup({
  options = {
    separator_style = "slant",
  },
})

require("oil").setup({
  view_options = {
    show_hidden = true,
  },
  float = {
    max_width = 0.5,
    preview_split = "left",
  },
  keymaps = {
    ["<C-n>"] = { "actions.close", mode = "n" },
  },
})

require("mini.pick").setup({
  mappings = {
    move_up = "<C-k>",
    move_down = "<C-j>",
  },
})

require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local map = function(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Blame current line
    map("n", "<leader>hb", function()
      gs.blame_line({ full = true })
    end)

    -- Blame whole file
    map("n", "<leader>hf", function()
      gs.blame({ full = true })
    end)
  end,
})

---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "typescript",
    "javascript",
  },
  highlight = { enable = true },
})

require("mason").setup({})

local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

---@diagnostic disable-next-line: param-type-mismatch
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set("n", "<leader>l", function()
  lint.try_lint()
end, { desc = "Trigger linting for current file" })

local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    graphql = { "prettierd" },
    lua = { "stylua" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })

-- colors
vim.cmd("colorscheme tokyonight-night")
vim.cmd(":hi statusline guibg=#2a9baf")
vim.cmd(":hi statusline guifg=#2b0000")
