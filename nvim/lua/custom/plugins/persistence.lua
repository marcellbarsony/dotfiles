-- Presistence
-- https://github.com/folke/persistence.nvim
-- `:h persistence.nvim.txt`

return {
  {
    "folke/persistence.nvim",
    cmd = "Persistence",
    opts = {
      dir = vim.fn.stdpath("state") .. "/sessions/",
      need = 1,
      branch = true
    }
  }
}
