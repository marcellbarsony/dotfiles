-- Harpoon 2
-- https://github.com/ThePrimeagen/harpoon
-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2 (merging )

local harpoon = require("harpoon")

harpoon:setup({
  global_settings = {
    save_on_toggle = true,
    save_on_change = true,
  }
})

-- {{{ Keymaps
-- List
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon" })
vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "Add" })

-- Next & Prev
vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Next" })
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Previous" })

-- Hotkeys
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
-- }}}
