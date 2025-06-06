local function get_typescript_server_path(root_dir)
  local project_root = vim.fs.dirname(vim.fs.find('node_modules', { path = root_dir, upward = true })[1])
  return project_root and vim.fs.joinpath(project_root, 'node_modules', 'typescript', 'lib') or ''
end

return {
  cmd = { 'vue-language-server', '--stdio' },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  root_markers = { 'package.json' },
  init_options = {
    typescript = {
      tsdk = '',
    },
    vue = {
      hybridMode = false,
    },
  },
  before_init = function(_, config)
    if config.init_options and config.init_options.typescript and config.init_options.typescript.tsdk == '' then
      config.init_options.typescript.tsdk = get_typescript_server_path(config.root_dir)
    end
  end,
}
