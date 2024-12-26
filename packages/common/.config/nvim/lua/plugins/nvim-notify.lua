return {
  "rcarriga/nvim-notify", -- A fancy, configurable, notification manager for NeoVim
  -- enabled = false,
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss all Notifications",
    },
  },
  opts = {
    -- timeout = 2000,
    timeout = 100,
    stage = "fade_in_slide_out",
    top_down = true,
    render = "simple",
    fps = 120,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
  },
}
