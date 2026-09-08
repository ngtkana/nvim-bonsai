if vim.fn.exists(':AcBundle') == 2 then
  vim.keymap.set('n', '<leader>cb', '<cmd>AcBundle<cr>', { buffer = true, desc = 'AcBundle' })
end
