-- ============================================================================
-- Minimal Neovim Config with Native LSP & Git Submodule Plugins
-- ============================================================================

-- 基本設定
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.completeopt = 'menu,menuone,noselect'

-- ============================================================================
-- mini.completion の設定
-- ============================================================================
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

-- ============================================================================
-- Treesitter の設定
-- ============================================================================
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

-- ============================================================================
-- LSP 設定: Neovim 0.11 ネイティブ vim.lsp.config を使用
-- ============================================================================

-- LSPサーバー定義: バイナリ名とfiletypeのマッピング
local lsp_servers = {
  {
    name = 'rust_analyzer',
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml' },
  },
  {
    name = 'pyright',
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'requirements.txt' },
  },
  {
    name = 'lua_ls',
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luacheckrc' },
  },
  {
    name = 'ts_ls',
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' },
  },
  {
    name = 'gopls',
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.mod', 'go.work' },
  },
  {
    name = 'clangd',
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    root_markers = { 'compile_commands.json', '.clangd' },
  },
  {
    name = 'bashls',
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'sh', 'bash' },
    root_markers = { '.git' },
  },
}

-- PATHにあるLSPサーバーのみを登録してFileTypeで自動起動
for _, server in ipairs(lsp_servers) do
  local binary = server.cmd[1]

  if vim.fn.executable(binary) == 1 then
    vim.api.nvim_create_autocmd('FileType', {
      pattern = server.filetypes,
      callback = function(ev)
        local bufname = vim.api.nvim_buf_get_name(ev.buf)
        if bufname == '' then
          return
        end

        -- root_dirを探す
        local root_dir = nil
        for _, marker in ipairs(server.root_markers) do
          local found = vim.fs.find(marker, { path = bufname, upward = true })[1]
          if found then
            root_dir = vim.fs.dirname(found)
            break
          end
        end

        if not root_dir then
          root_dir = vim.fs.dirname(bufname)
        end

        -- LSPクライアントを起動
        vim.lsp.start({
          name = server.name,
          cmd = server.cmd,
          root_dir = root_dir,
        })
      end,
      desc = string.format('Start %s LSP', server.name),
    })

    vim.notify(string.format('✓ LSP ready: %s', server.name), vim.log.levels.INFO)
  end
end

-- ============================================================================
-- LSP キーマッピング (LspAttach で自動設定)
-- ============================================================================
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    -- 移動
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)

    -- ドキュメント
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

    -- コード操作
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, opts)

    -- 診断
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
  end,
})

-- ============================================================================
-- 診断表示の設定
-- ============================================================================
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    source = 'if_many',
  },
  float = {
    source = 'always',
    border = 'rounded',
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- 診断記号のカスタマイズ
local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- ============================================================================
-- リーダーキーの設定
-- ============================================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
