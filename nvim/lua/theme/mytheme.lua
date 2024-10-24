-- vim.o.background = "dark"

require("my-theme").setup({
  -- (note: if your configuration sets vim.o.background the following option will do nothing!)
  theme = "dark", -- dark/light
  flavor = "green",
  transparent = true,
  italics = {
    comments = false,  -- Italicize comments
    keywords = false,  -- Italicize keywords
    functions = false, -- Italicize functions
    strings = false,   -- Italicize strings
    variables = false, -- Italicize variables
  },
  overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
})

vim.cmd.colorscheme('my-theme')
