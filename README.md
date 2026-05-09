# 最小限のNeovim設定 (盆栽スタイル)

## 設計思想

- **脱・全部入り**: lazy.nvim や mason.nvim は不要
- **ネイティブ重視**: Neovim 0.11+ のネイティブLSP (`vim.lsp.start`) を直接使用
- **ポータビリティ**: `$PATH` にあるLSPを自動検知する「あったら使う」構成
- **Git管理**: プラグインは全て Git submodule として管理（自動生成ファイルなし）

## 導入済みプラグイン

全て `pack/plugins/start/` 配下に Git submodule として配置:

- `nvim-treesitter` - 高精度な構文ハイライト
- `mini.nvim` - mini.completion のみを使用（最小限の補完UI）

**注**: nvim-lspconfigは使用しません。Neovim 0.11+では非推奨となり、ネイティブの `vim.lsp.start()` で十分です。

## 環境確認

```bash
./check-env.sh
```

Neovimのバージョン、プラグインのロード状態、利用可能なLSPサーバーを確認できます。

## 起動方法

```bash
NVIM_APPNAME=nvim-sandbox nvim
```

または、エイリアスを設定:

```bash
alias nvs='NVIM_APPNAME=nvim-sandbox nvim'
```

## 対応LSPサーバー

以下のツールが `$PATH` にあれば自動的に有効化:

- `rust-analyzer` (Rust)
- `pyright` (Python)
- `lua-language-server` (Lua)
- `typescript-language-server` (TypeScript/JavaScript)
- `gopls` (Go)
- `clangd` (C/C++)
- `bash-language-server` (Bash)

## LSPキーマッピング

| キー | 機能 |
|------|------|
| `gd` | 定義へ移動 |
| `gD` | 宣言へ移動 |
| `gi` | 実装へ移動 |
| `gr` | 参照一覧 |
| `gy` | 型定義へ移動 |
| `K` | ホバードキュメント |
| `<C-k>` | シグネチャヘルプ |
| `<leader>rn` | リネーム |
| `<leader>ca` | コードアクション |
| `<leader>f` | フォーマット |
| `[d` | 前の診断へ |
| `]d` | 次の診断へ |
| `<leader>e` | 診断をフロートで表示 |
| `<leader>q` | 診断をロケーションリストへ |

リーダーキーは `<Space>` に設定。

## プラグインの更新

```bash
git submodule update --remote --merge
```

## Treesitter パーサーのインストール

必要に応じて手動でインストール:

```vim
:TSInstall rust python lua
```

## 追加したくなったら

不便を感じたら、自分で足す。それが盆栽スタイル。
