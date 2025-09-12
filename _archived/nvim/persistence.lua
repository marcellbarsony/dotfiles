-- Presistence
-- https://github.com/folke/persistence.nvim
-- `:h persistence.nvim.txt`

return {
  {
    "folke/persistence.nvim",
    cmd = "Persistence",
    keys = {
      { "<leader>pd", function() require("persistence").load() end, desc = "Directory" },
      { "<leader>ps", function() require("persistence").select() end, desc = "Select" },
      { "<leader>pl", function() require("persistence").load({ last = true }) end, desc = "Last" },
      { "<leader>pq", function() require("persistence").stop() end, desc = "Quit" },
    },
    opts = {
      dir = vim.fn.stdpath("state") .. "/sessions/",
      need = 1,
      branch = true
    }
  }
}
