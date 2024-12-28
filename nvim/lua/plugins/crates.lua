-- Crates
-- https://github.com/saecki/crates.nvim

return {
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
        require("crates").setup()
    end
  }
}
