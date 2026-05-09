#!/usr/bin/env bash
# Neovim環境の確認スクリプト

set -e

APPNAME="${NVIM_APPNAME:-nvim-sandbox}"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Neovim Environment Check"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo -e "\n📦 Neovim Version"
NVIM_APPNAME="$APPNAME" nvim --version | head -3

echo -e "\n🔌 Plugins (Git Submodules)"
if [ -d "pack/plugins/start" ]; then
  ls -1 pack/plugins/start/ | while read -r plugin; do
    echo "  ✓ $plugin"
  done
else
  echo "  ✗ pack/plugins/start/ not found"
fi

echo -e "\n🛠️  LSP Servers in \$PATH"
declare -A lsp_servers=(
  ["rust-analyzer"]="Rust"
  ["pyright"]="Python"
  ["lua-language-server"]="Lua"
  ["typescript-language-server"]="TypeScript/JavaScript"
  ["gopls"]="Go"
  ["clangd"]="C/C++"
  ["bash-language-server"]="Bash"
)

for cmd in "${!lsp_servers[@]}"; do
  lang="${lsp_servers[$cmd]}"
  if command -v "$cmd" &> /dev/null; then
    printf "  ✓ %-30s %s\n" "$cmd" "→ $lang"
  else
    printf "  ✗ %-30s %s\n" "$cmd" "(not installed)"
  fi
done

echo -e "\n🧪 Plugin Loading Test"
NVIM_APPNAME="$APPNAME" nvim --headless \
  +"lua if pcall(require, 'mini.completion') then print('  ✓ mini.completion loaded') end" \
  +"lua if pcall(require, 'nvim-treesitter') then print('  ✓ nvim-treesitter loaded') end" \
  +quit 2>&1 | grep "✓" || echo "  ✗ Failed to load plugins"

echo -e "\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "💡 起動方法: \033[1mNVIM_APPNAME=$APPNAME nvim\033[0m"
echo -e "💡 エイリアス: \033[1malias nvs='NVIM_APPNAME=$APPNAME nvim'\033[0m"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
