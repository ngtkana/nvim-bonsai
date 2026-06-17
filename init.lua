-- ============================================================================
-- Minimal Neovim Config with Native LSP & Git Submodule Plugins
-- ============================================================================

-- リーダーキーの設定（プラグインより先に設定）
vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

-- ============================================================================
-- 基本設定
-- ============================================================================
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.completeopt = 'menu,menuone,noselect'

-- ============================================================================
-- モジュール読み込み
-- ============================================================================
require('options')  -- 追加の基本設定
require('plugins')  -- プラグイン設定
require('lsp')      -- LSP設定
require('keymaps')  -- キーマップ
