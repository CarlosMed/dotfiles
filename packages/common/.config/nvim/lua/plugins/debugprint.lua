local js = {
  left = 'console.log("',
  right = '")',
  mid_var = '", ',
  right_var = ")",
}

return {
  "andrewferrier/debugprint.nvim",
  event = "VeryLazy",
  opts = {
    filetypes = {
      ["typescript"] = js,
      ["typescriptreact"] = js,
      ["javascript"] = js,
      ["javascriptreact"] = js,
    },
  },
  config = true,
  version = "*",
}
