return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
      mappings = {
        ["j"] = function() vim.cmd("normal! k") end,
        ["k"] = function() vim.cmd("normal! j") end,
      },
    },
  },
}
