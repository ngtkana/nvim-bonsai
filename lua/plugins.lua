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

-- mini.statusline の設定（ステータスライン）
local has_mini_statusline, mini_statusline = pcall(require, 'mini.statusline')
if has_mini_statusline then
  mini_statusline.setup()
end

-- which-key の設定
local has_which_key, which_key = pcall(require, 'which-key')
if has_which_key then
  which_key.setup({
    preset = 'helix',  -- 表示スタイル
    delay = 100,       -- 表示までの遅延
    icons = {
      breadcrumb = '»',
      separator = '➜',
      group = '+',
    },
  })

  -- キーマップグループの説明を登録
  which_key.add({
    { '<leader>f', group = 'find' },
    { '<leader>e', group = 'edit' },
    { '<leader>s', group = 'source' },
    { '<leader>c', group = 'code' },
    { '<leader>a', group = 'claude' },
    { '<leader>g', group = 'git' },
  })
end

-- mini.surround の設定（括弧・クォート操作）
local has_mini_surround, mini_surround = pcall(require, 'mini.surround')
if has_mini_surround then
  mini_surround.setup()
end

-- mini.comment の設定（コメントアウト）
local has_mini_comment, mini_comment = pcall(require, 'mini.comment')
if has_mini_comment then
  mini_comment.setup()
end

-- mini.ai の設定（テキストオブジェクト拡張）
local has_mini_ai, mini_ai = pcall(require, 'mini.ai')
if has_mini_ai then
  mini_ai.setup()
end

-- mini.hipatterns の設定（パターンハイライト）
local has_mini_hipatterns, mini_hipatterns = pcall(require, 'mini.hipatterns')
if has_mini_hipatterns then
  mini_hipatterns.setup({
    highlighters = {
      -- カラーコード (#rrggbb, #rgb)
      hex_color = mini_hipatterns.gen_highlighter.hex_color(),
      -- TODO, FIXME, NOTE などのキーワード
      fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
      hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
      todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
      note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
    },
  })
end

-- neo-tree の設定（ファイラ）
local has_neotree, neotree = pcall(require, 'neo-tree')
if has_neotree then
  neotree.setup({
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_ignored = false,
      },
    },
    window = {
      width = 30,
      mappings = {
        ['<space>'] = 'none',
        ['h'] = 'close_node',
        ['l'] = 'open',
      },
    },
  })
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

-- snacks.nvim の設定（claudecode.nvim の依存）
local has_snacks, snacks = pcall(require, 'snacks')
if has_snacks then
  snacks.setup({
    indent = { enabled = false },  -- mini.indent と競合しないように
    input = { enabled = true },
    picker = { enabled = false },  -- mini.pick を使用
    terminal = { enabled = true },
  })
end

-- claudecode.nvim の設定
local has_claudecode, claudecode = pcall(require, 'claudecode')
if has_claudecode then
  claudecode.setup({
    log_level = 'info',
    terminal = {
      provider = 'snacks',
      diff_split_width_percentage = 40,
    },
    diff_opts = {
      layout = 'vertical',
      keep_terminal_focus = false,
      open_in_new_tab = false,
    },
  })
end
