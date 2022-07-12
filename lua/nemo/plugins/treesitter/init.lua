local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

configs.setup {
  ensure_installed = {
    'java',
    'bash',
    'lua',
    'python',
    'markdown',
    'javascript',
    'html',
    'css',
    'c',
    'cpp',
    'go'
  },
  sync_install = { 'false' },
  highlight = {
    enable = true,
  }
}
