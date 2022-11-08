local status, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

treesitter_configs.setup {
  ensure_installed = { "c", "lua", "python" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
