local status, _ = pcall(require, 'Comment')
if not status then
  print('plugins/comment :: comment not loaded')
  return
end

require('Comment').setup({})
