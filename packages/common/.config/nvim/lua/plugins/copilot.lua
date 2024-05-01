return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    -- enabled = false,
    event = "InsertEnter",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
      panel = {
        enabled = true,
        auto_trigger = true,
      },
      filetype = { help = true, markdown = true },
    },
  },
}
