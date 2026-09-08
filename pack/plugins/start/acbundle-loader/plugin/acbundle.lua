-- ac-adapter-rs の :AcBundle をロードする薄いローダー。
-- 実体（nvim/plugin/acbundle.lua）は $AC_ADAPTER_RS_ROOT が指す作業クローンに置いたままにし、
-- このリポジトリにはコピーもパスも持たない。

local root = os.getenv('AC_ADAPTER_RS_ROOT')
if not root or root == '' then
  return
end

local plugin_file = root .. '/nvim/plugin/acbundle.lua'
if vim.fn.filereadable(plugin_file) == 1 then
  vim.opt.rtp:append(root .. '/nvim')
  dofile(plugin_file)
end
