-- ============================================================================
-- プラグイン設定
-- ============================================================================

-- mini.completion の設定
local has_mini_completion, mini_completion = pcall(require, 'mini.completion')
if has_mini_completion then
  mini_completion.setup({
    delay = { completion = 100, info = 100, signature = 50 },
    window = {
      info = { height = 25, width = 80, border = 'none' },
      signature = { height = 25, width = 80, border = 'none' },
    },
    lsp_completion = {
      source_func = 'completefunc',
      auto_setup = true,
    },
  })
end

-- mini.pick の設定（telescope 代替）
local has_mini_pick, mini_pick = pcall(require, 'mini.pick')
if has_mini_pick then
  mini_pick.setup({
    mappings = {
      choose_in_split = '<C-s>',
      choose_in_vsplit = '<C-v>',
    },
  })
end

-- mini.notify の設定（通知表示）
local has_mini_notify, mini_notify = pcall(require, 'mini.notify')
if has_mini_notify then
  mini_notify.setup()
end

-- mini.git の設定（Git 統合）
local has_mini_git, mini_git = pcall(require, 'mini.git')
if has_mini_git then
  mini_git.setup()
end

-- mini.statusline の設定（ステータスライン）
local has_mini_statusline, mini_statusline = pcall(require, 'mini.statusline')
if has_mini_statusline then
  mini_statusline.setup()
end

-- Treesitter の設定
local has_treesitter, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if has_treesitter then
  treesitter_configs.setup({
    ensure_installed = {},
    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  })
end
