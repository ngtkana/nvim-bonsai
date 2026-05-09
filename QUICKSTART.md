# クイックスタート

## 初回セットアップ

```bash
# このリポジトリをクローン
git clone <your-repo-url> ~/.config/nvim-sandbox
cd ~/.config/nvim-sandbox

# submoduleを初期化（プラグインのダウンロード）
git submodule update --init --recursive

# 環境確認
./check-env.sh
```

## Treesitterパーサーのインストール

初回起動後、必要な言語のパーサーを手動でインストール:

```vim
:TSInstall rust python lua javascript
```

または、すべてインストール:

```vim
:TSInstallAll
```

## LSPサーバーのインストール

この設定は「PATHにあれば使う」スタイルなので、必要なLSPサーバーを個別にインストール:

### Rust
```bash
rustup component add rust-analyzer
```

### Python
```bash
pip install pyright
# または
pipx install pyright
```

### Lua
```bash
# Homebrewの場合
brew install lua-language-server

# 手動の場合
https://github.com/LuaLS/lua-language-server/releases
```

### TypeScript/JavaScript
```bash
npm install -g typescript-language-server typescript
```

### Go
```bash
go install golang.org/x/tools/gopls@latest
```

### その他
- C/C++: `clangd` (通常はLLVMに含まれる)
- Bash: `npm install -g bash-language-server`

## 使い方

### 起動

```bash
NVIM_APPNAME=nvim-sandbox nvim
```

エイリアス設定（`.bashrc` / `.zshrc`に追加）:

```bash
alias nvs='NVIM_APPNAME=nvim-sandbox nvim'
```

### LSPキーマッピング（ファイルを開いた状態で）

| キー | 機能 |
|------|------|
| `gd` | 定義へ移動 |
| `gD` | 宣言へ移動 |
| `gi` | 実装へ移動 |
| `gr` | 参照一覧 |
| `K` | ホバードキュメント |
| `<Space>rn` | リネーム |
| `<Space>ca` | コードアクション |
| `<Space>f` | フォーマット |
| `[d` | 前の診断へ |
| `]d` | 次の診断へ |
| `<Space>e` | 診断をフロート表示 |

### 補完（mini.completion）

- 自動的に補完候補が表示されます
- `<C-n>` / `<C-p>`: 候補の選択
- `<CR>`: 補完確定

## プラグインの更新

```bash
git submodule update --remote --merge
git add pack/plugins/start
git commit -m "chore: update plugins"
```

## カスタマイズ

`init.lua`を直接編集してください。構造はシンプルなので、以下の箇所を変更するだけ:

- **基本設定**: 6-15行目 (行番号、タブ幅など)
- **LSPサーバー追加**: 60-90行目 (`lsp_servers`テーブル)
- **キーマッピング**: 135-160行目 (LspAttachコールバック内)

## トラブルシューティング

### LSPが起動しない

```vim
:checkhealth lsp
```

### プラグインが読み込まれない

```bash
./check-env.sh
```

### LSPログを確認

```bash
tail -f ~/.local/state/nvim-sandbox/lsp.log
```

## 盆栽スタイルの心得

- **不便を感じたら足す**: 最初から全部入れない
- **理解できるコードだけ使う**: init.luaは全行読めるサイズ
- **Gitで管理**: submoduleの更新も手動で明示的に
- **lazy-lock.jsonのような自動生成ファイルは存在しない**: クリーンなGit履歴

楽しいNeovimライフを！
