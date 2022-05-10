local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status then
  print("plugins/lsp-installer :: lsp_installer not loaded")
  return
end

lsp_installer.setup {}

