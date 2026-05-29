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

-- mini.files の設定（ファイルツリー）
local has_mini_files, mini_files = pcall(require, 'mini.files')
if has_mini_files then
  mini_files.setup({
    mappings = {
      close = 'q',
      go_in = 'l',
      go_in_plus = '<CR>',
      go_out = 'h',
      go_out_plus = 'H',
      reset = '<BS>',
      show_help = 'g?',
      synchronize = '=',
      trim_left = '<',
      trim_right = '>',
    },
  })
end

-- mini.clue の設定（which-key 代替）
local has_mini_clue, mini_clue = pcall(require, 'mini.clue')
if has_mini_clue then
  mini_clue.setup({
    triggers = {
      -- Leader キー
      { mode = 'n', keys = ',' },
      { mode = 'x', keys = ',' },
      -- Built-in completion
      { mode = 'i', keys = '<C-x>' },
      -- `g` key
      { mode = 'n', keys = 'g' },
      { mode = 'x', keys = 'g' },
      -- Window commands
      { mode = 'n', keys = '<C-w>' },
      -- `z` key
      { mode = 'n', keys = 'z' },
    },
    clues = {
      -- Leader キーのグループ化
      { mode = 'n', keys = ',f', desc = '+find' },
      { mode = 'n', keys = ',e', desc = '+edit' },
      { mode = 'n', keys = ',s', desc = '+source' },
      { mode = 'n', keys = ',c', desc = '+code' },
      -- Built-in clues
      mini_clue.gen_clues.builtin_completion(),
      mini_clue.gen_clues.g(),
      mini_clue.gen_clues.windows(),
      mini_clue.gen_clues.z(),
    },
    window = {
      delay = 100,  -- 表示までの遅延を 100ms に短縮（デフォルト 1000ms）
      config = {
        anchor = 'SW',  -- 左下に表示（デフォルトは右下）
        row = 'auto',
        col = 'auto',
      },
    },
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

-- oil.nvim の設定（ファイラ）
local has_oil, oil = pcall(require, 'oil')
if has_oil then
  oil.setup({
    columns = {
      'icon',
      'permissions',
      'size',
      'mtime',
    },
    keymaps = {
      ['g?'] = 'actions.show_help',
      ['<CR>'] = 'actions.select',
      ['<C-v>'] = 'actions.select_vsplit',
      ['<C-s>'] = 'actions.select_split',
      ['<C-t>'] = 'actions.select_tab',
      ['<C-p>'] = 'actions.preview',
      ['<C-c>'] = 'actions.close',
      ['<C-l>'] = 'actions.refresh',
      ['-'] = 'actions.parent',
      ['_'] = 'actions.open_cwd',
      ['`'] = 'actions.cd',
      ['~'] = 'actions.tcd',
      ['gs'] = 'actions.change_sort',
      ['gx'] = 'actions.open_external',
      ['g.'] = 'actions.toggle_hidden',
      ['g\\'] = 'actions.toggle_trash',
    },
    view_options = {
      show_hidden = true,
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
