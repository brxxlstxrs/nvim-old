local globals = {
  -- did_install_default_menus = 1,
  -- did_install_syntax_menu = 1,
  loaded_syntax_completion = 1,
  loaded_spellfile_plugin = 1,
  loaded_sql_completion = 1,
}

for k, v in pairs(globals) do
  vim.g[k] = v
end
