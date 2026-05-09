-- ============================================================================
-- 追加の基本設定
-- ============================================================================

local opt = vim.opt

-- クリップボード
opt.clipboard = 'unnamedplus'

-- マウス
opt.mouse = 'a'

-- UI
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- ファイル管理
opt.backup = false
opt.swapfile = false
opt.writebackup = false

-- 検索
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- 折りたたみ
opt.foldmethod = 'marker'
opt.foldlevel = 99
