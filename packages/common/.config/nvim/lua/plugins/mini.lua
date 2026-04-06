return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.surround").setup()
    require("mini.pairs").setup()
    require("mini.comment").setup({
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring()
        end,
      },
    })
  end,
}
