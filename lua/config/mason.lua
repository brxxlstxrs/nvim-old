local status1, mason = pcall(require, 'mason')
if not status1 then
  return
end

mason.setup()

local status2, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status2 then
  return
end

mason_lspconfig.setup()
