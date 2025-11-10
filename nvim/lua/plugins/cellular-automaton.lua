return {
  "eandrju/cellular-automaton.nvim",
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
    keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")
  end,
}
