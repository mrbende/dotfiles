return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({})

    local keymap = vim.keymap
    local api = require("supermaven-nvim.api")

    -- Supermaven keymaps
    keymap.set("n", "<leader>mt", api.toggle, { desc = "Toggle Supermaven" })
    keymap.set("n", "<leader>ma", api.start, { desc = "Start Supermaven" })
    keymap.set("n", "<leader>mq", api.stop, { desc = "Stop Supermaven" })
    keymap.set("n", "<leader>mr", api.restart, { desc = "Restart Supermaven" })
  end,
}
