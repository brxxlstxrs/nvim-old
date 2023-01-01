local status, noice = pcall(require, "noice")
if not status then
  return
end

local opts = {
  cmdline = {
    enabled = false,
  },
  messages = {
    enabled = false,
  },
  popupmenu = {
    enabled = false,
  },
}

noice.setup(opts)
