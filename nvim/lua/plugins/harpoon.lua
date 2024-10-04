-- Harpoon 2
-- https://github.com/ThePrimeagen/harpoon
-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2 (merging)

local harpoon = require("harpoon")

harpoon:setup({
  global_settings = {
    save_on_toggle = true,
    save_on_change = true,
  }
})

-- Telescope {{{
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end
-- }}}

-- Keymaps {{{
-- Menu
vim.keymap.set("n", "<C-b>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon" })
vim.keymap.set("n", "<leader>bb", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon" })
vim.keymap.set("n", "<leader>ba", function() harpoon:list():append() end, { desc = "Add" })

-- Telescope
vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Harpoon" })

-- Next & Prev
vim.keymap.set("n", "<leader>bn", function() harpoon:list():next() end, { desc = "Next" })
vim.keymap.set("n", "<leader>bp", function() harpoon:list():prev() end, { desc = "Previous" })

-- Hotkeys
vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
-- }}}
