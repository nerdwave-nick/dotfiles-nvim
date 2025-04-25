return {
  init_options = {
    hostInfo = 'neovim',
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = '/usr/local/lib/node_modules/@vue/typescript-plugin',
        languages = { 'javascript', 'typescript', 'vue' },
      },
    },
  },
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue',
  },
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
}
