local status, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

local ensure_installed = {
  "c", "lua", "python", "cpp",
  "vim", "regex", "bash", "markdown", "markdown_inline" }

treesitter_configs.setup {
  ensure_installed = ensure_installed,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
