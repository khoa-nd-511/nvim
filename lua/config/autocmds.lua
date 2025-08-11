---@diagnostic disable-next-line: param-type-mismatch
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if not client then return end

    local caps = client.server_capabilities

    ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
    if client:supports_method('textDocument/completion') then
      -- extends chars to trigger completion
      if caps then
        if caps.completionProvider and type(caps.completionProvider) == 'table' then
          if not caps.completionProvider.triggerCharacters then
            caps.completionProvider.triggerCharacters = {}
          end

          for i = 97, 122 do
            table.insert(caps.completionProvider.triggerCharacters, string.char(i))
          end
        end
      end

      -- enable completion
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.cmd [[set completeopt+=menuone,noselect,popup]]
