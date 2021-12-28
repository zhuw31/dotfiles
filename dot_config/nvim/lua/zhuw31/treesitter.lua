local status_ok, configs = pcall(require, 'nvim-treesitter.config')
if not status_ok then
  return
end

configs.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}
