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
