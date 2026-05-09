-- ============================================================================
-- キーマップ定義
-- ============================================================================

local map = vim.keymap.set

-- mini.pick (telescope 代替)
map('n', '<leader>ff', function()
  require('mini.pick').builtin.files()
end, { desc = 'Find files' })

map('n', '<leader>fg', function()
  require('mini.pick').builtin.grep_live()
end, { desc = 'Live grep' })

map('n', '<leader>fb', function()
  require('mini.pick').builtin.buffers()
end, { desc = 'Buffers' })

map('n', '<leader>fh', function()
  require('mini.pick').builtin.help()
end, { desc = 'Help tags' })

-- ファイル保存 + 通知
map('n', '<leader>w', function()
  vim.cmd('write')
  require('mini.notify').add('ファイルを保存しました')
end, { desc = 'Save file' })

-- nvim 設定
map('n', '<leader>ev', function()
  vim.cmd('edit ' .. vim.fn.stdpath('config'))
end, { desc = 'Open config' })

map('n', '<leader>sv', function()
  dofile(vim.fn.stdpath('config') .. '/init.lua')
  require('mini.notify').add('init.lua を再読み込みしました')
end, { desc = 'Reload init.lua' })

-- コードアクション
map('n', 'ga', vim.lsp.buf.code_action, { desc = 'Code action' })
