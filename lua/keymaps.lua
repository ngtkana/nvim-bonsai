-- ============================================================================
-- キーマップ定義
-- ============================================================================

local map = vim.keymap.set

-- neo-tree (ファイラ)
map('n', '|', '<cmd>Neotree toggle<cr>', { desc = 'Toggle file explorer' })

map('n', '-', '<cmd>Neotree reveal<cr>', { desc = 'Reveal current file in explorer' })

map('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle file explorer' })

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

-- ファイル保存
map('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save file' })

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

-- lazygit
map('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })

-- Claude Code
map('n', '<leader>ac', '<cmd>ClaudeCode<cr>', { desc = 'Toggle Claude' })
map('n', '<leader>af', '<cmd>ClaudeCodeFocus<cr>', { desc = 'Focus Claude' })
map('n', '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', { desc = 'Select model' })
map('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', { desc = 'Add current buffer' })
map('v', '<leader>as', '<cmd>ClaudeCodeSend<cr>', { desc = 'Send to Claude' })
map('n', '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', { desc = 'Accept diff' })
map('n', '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', { desc = 'Deny diff' })
