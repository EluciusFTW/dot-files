return {
  "eandrju/cellular-automaton.nvim",
  config = function()
    vim.keymap.set("n", "<leader>fmr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make it rain" })
    vim.keymap.set("n", "<leader>fms", "<cmd>CellularAutomaton scramble<CR>", { desc = "Scramble text" })
    vim.keymap.set("n", "<leader>fmg", "<cmd>CellularAutomaton game_of_life<CR>", { desc = "Game of Life" })
  end,
}
