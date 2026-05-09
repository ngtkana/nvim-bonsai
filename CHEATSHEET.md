# nvim-sandbox チートシート

## キーマップ一覧

| キー | 機能 | プラグイン | 設定場所 |
|------|------|-----------|---------|
| **ファイル操作** |
| `-` | カレントファイルのディレクトリを開く | mini.files | lua/keymaps.lua |
| `,e` | カレントディレクトリを開く | mini.files | lua/keymaps.lua |
| `,ff` | ファイル検索 | mini.pick | lua/keymaps.lua |
| `,fg` | grep検索（ライブ） | mini.pick | lua/keymaps.lua |
| `,fb` | バッファ一覧 | mini.pick | lua/keymaps.lua |
| `,fh` | ヘルプ検索 | mini.pick | lua/keymaps.lua |
| **編集** |
| `,w` | ファイル保存 + 通知 | mini.notify | lua/keymaps.lua |
| `,ev` | nvim設定フォルダを開く | ネイティブ | lua/keymaps.lua |
| `,sv` | init.lua 再読み込み | ネイティブ | lua/keymaps.lua |
| **LSP** |
| `gd` | 定義へ移動 | ネイティブLSP | lua/lsp.lua |
| `gD` | 宣言へ移動 | ネイティブLSP | lua/lsp.lua |
| `gi` | 実装へ移動 | ネイティブLSP | lua/lsp.lua |
| `gr` | 参照一覧 | ネイティブLSP | lua/lsp.lua |
| `gy` | 型定義へ移動 | ネイティブLSP | lua/lsp.lua |
| `K` | ホバードキュメント | ネイティブLSP | lua/lsp.lua |
| `<C-k>` | シグネチャヘルプ | ネイティブLSP | lua/lsp.lua |
| `ga` | コードアクション | ネイティブLSP | lua/keymaps.lua, lua/lsp.lua |
| `,rn` | リネーム | ネイティブLSP | lua/lsp.lua |
| `,ca` | コードアクション | ネイティブLSP | lua/lsp.lua |
| `,f` | フォーマット | ネイティブLSP | lua/lsp.lua |
| `]d` | 次の診断へ | ネイティブLSP | lua/lsp.lua |
| `[d` | 前の診断へ | ネイティブLSP | lua/lsp.lua |
| `,e` (診断) | 診断をフロート表示 | ネイティブLSP | lua/lsp.lua |
| `,q` | 診断をロケーションリストへ | ネイティブLSP | lua/lsp.lua |
| **ヘルプ** |
| `,` | キーバインドヘルプ表示 | mini.clue | lua/plugins.lua |

## mini.files 操作（ファイルツリー）

| キー | 機能 |
|------|------|
| `h` | 親ディレクトリへ移動 |
| `l` | 子ディレクトリへ移動 / ファイルを開く |
| `<CR>` | ファイルを開く |
| `j` / `k` | 上下移動 |
| `=` | 変更を保存（ファイル操作後） |
| `q` | 閉じる |
| `g?` | ヘルプ表示 |
| `<` | 左側を縮小 |
| `>` | 右側を縮小 |
| `<BS>` | リセット |

**設定場所**: lua/plugins.lua

**ファイル操作方法**:
- ファイル名を編集して保存（`=`）→ リネーム
- 行をコピー/ペースト → ファイルコピー
- 行を削除 → ファイル削除

## mini.pick 操作（ファジーファインダー）

| キー | 機能 |
|------|------|
| `<C-n>` / `<C-p>` | 次/前の候補へ |
| `<C-s>` | 水平分割で開く |
| `<C-v>` | 垂直分割で開く |
| `<CR>` | 候補を選択 |
| `<Esc>` | キャンセル |

**設定場所**: lua/plugins.lua

## 機能とプラグインの対応表

| 機能 | プラグイン | 設定ファイル |
|------|-----------|------------|
| **補完** | mini.completion | lua/plugins.lua |
| **ファイル検索** | mini.pick | lua/plugins.lua |
| **ファイルツリー** | mini.files | lua/plugins.lua |
| **通知** | mini.notify | lua/plugins.lua |
| **Git統合** | mini.git | lua/plugins.lua |
| **ステータスライン** | mini.statusline | lua/plugins.lua |
| **キーバインドヘルプ** | mini.clue | lua/plugins.lua |
| **構文ハイライト** | nvim-treesitter | lua/plugins.lua |
| **LSP** | Neovim ネイティブ | lua/lsp.lua |

## 基本設定の場所

| 設定項目 | ファイル |
|---------|---------|
| Leader キー | init.lua |
| エディタ基本設定（行番号等） | init.lua |
| 追加の基本設定（clipboard等） | lua/options.lua |
| プラグイン設定 | lua/plugins.lua |
| LSP設定 | lua/lsp.lua |
| キーマップ | lua/keymaps.lua |

## 対応LSPサーバー

以下のLSPサーバーが `$PATH` にあれば自動的に有効化されます：

| 言語 | LSPサーバー | インストール方法 |
|------|------------|----------------|
| Rust | rust-analyzer | `rustup component add rust-analyzer` |
| Python | pyright | `pip install pyright` |
| Lua | lua-language-server | システムパッケージマネージャー |
| TypeScript/JavaScript | typescript-language-server | `npm install -g typescript-language-server` |
| Go | gopls | `go install golang.org/x/tools/gopls@latest` |
| C/C++ | clangd | システムパッケージマネージャー |
| Bash | bash-language-server | `npm install -g bash-language-server` |

**設定場所**: lua/lsp.lua (lsp_servers テーブル)

## Treesitter パーサーのインストール

Neovim内で以下を実行：

```vim
:TSInstall rust python lua javascript
```

## プラグイン更新

```bash
cd ~/.config/nvim-sandbox
git submodule update --remote --merge
git add pack/plugins/start
git commit -m "chore: update plugins"
```

## トラブルシューティング

### 設定が読み込まれない
```bash
NVIM_APPNAME=nvim-sandbox nvim --headless -c "checkhealth" -c "quit"
```

### LSPが起動しない
```bash
# LSPサーバーがPATHにあるか確認
which rust-analyzer

# Neovim内で確認
:checkhealth lsp
```

### プラグインが動作しない
```bash
# 環境確認スクリプトを実行
./check-env.sh
```

## 設定ファイル構成

```
~/.config/nvim-sandbox/
├── init.lua           - エントリーポイント、Leader設定
├── lua/
│   ├── options.lua    - 追加の基本設定
│   ├── plugins.lua    - mini.nvim、treesitter設定
│   ├── lsp.lua        - LSP設定
│   └── keymaps.lua    - キーマップ定義
└── pack/plugins/start/
    ├── mini.nvim/     - オールインワンプラグイン
    └── nvim-treesitter/ - 構文解析
```

## mini.nvim で使用中のモジュール

- `mini.completion` - 補完エンジン
- `mini.pick` - ファジーファインダー（telescope代替）
- `mini.files` - ファイルツリー（neo-tree代替）
- `mini.notify` - 通知システム（fidget代替）
- `mini.git` - Git統合（gitsigns代替）
- `mini.statusline` - ステータスライン（lualine代替）
- `mini.clue` - キーバインドヘルプ（which-key代替）

**利用可能だが未使用のモジュール**: 全45個中38個が未使用（必要に応じて追加可能）
