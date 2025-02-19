-- Presistence
-- `:h persistence.nvim.txt`
-- https://github.com/folke/persistence.nvim

return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      dir = vim.fn.stdpath("state") .. "/sessions/",
      need = 1,
      branch = true
    }
  }
}
