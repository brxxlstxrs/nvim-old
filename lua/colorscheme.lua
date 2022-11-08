local status, onenord = pcall(require, 'onenord')
if not status then
  return
end

onenord.setup()
