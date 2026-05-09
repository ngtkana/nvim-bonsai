# nvim-bonsai

盆栽スタイルの最小限 Neovim 設定。依存ゼロ、手動管理、深く理解できる。

## 特徴

- **Neovim 0.11+ ネイティブ LSP** - nvim-lspconfig 不要、`vim.lsp.start()` を直接使用
- **Git submodule 管理** - lazy.nvim/mason.nvim 不要、プラグイン 4 個のみ
- **mini.nvim ベース** - ファイル検索、ファイルツリー、通知など全て内蔵
- **外部ライブラリ補完対応** - Rust (serde)、Python (uv/conda) で動作確認済み
- **lazygit 統合** - `,gg` でインタラクティブな Git 操作

## セットアップ

```bash
# クローン
git clone --recursive https://github.com/ngtkana/nvim-bonsai.git ~/.config/nvim

# LSP サーバーをインストール（必要なもののみ）
rustup component add rust-analyzer  # Rust
uv tool install pyright              # Python
# npm install -g typescript-language-server  # TypeScript/JavaScript
# go install golang.org/x/tools/gopls@latest  # Go

# 起動
nvim
```

## 動作確認

外部ライブラリの補完が効くことを確認：

```bash
# Rust: serde クレートの補完
nvim examples/rust/src/main.rs

# Python (uv): requests ライブラリの補完
nvim examples/uv/main.py

# Python (conda): numpy/pandas の補完
nvim examples/conda/main.py
```

`person.` や `response.` と入力して `<C-n>` で補完候補が表示される。

## 主なキーマップ

- **LSP**: `gd` 定義, `K` ドキュメント, `ga` コードアクション, `]d`/`[d` 診断移動
- **ファイル**: `|` ツリートグル, `,ff` 検索, `,fg` grep, `,w` 保存
- **Git**: `,gg` lazygit 起動
- **Leader キー**: `,`
