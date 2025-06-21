local mason_packages = vim.fn.expand("$MASON/packages")
local vue_ls_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"

return {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    vue = { hybridMode = true },
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },
  },
}
