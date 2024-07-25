-- neotest plugin configuration so I can run tests

---@type LazySpec
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest"
  },
  opts = {
    adapters = {
      ["neotest-vitest"] = {},
    }
  }
}
