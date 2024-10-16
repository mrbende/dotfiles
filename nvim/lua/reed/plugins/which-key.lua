return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- can load after UI is rendered
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 480
  end,
  opts = {
    -- config comes here
    -- empty for default settings
  },
}
