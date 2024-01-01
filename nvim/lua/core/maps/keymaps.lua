-- Keymaps
-- https://neovim.io/doc/user/map.html

-- Modes
--  n - normal_mode
--  i - insert_mode
--  v - visual_mode
--  x - visual_block_mode
--  t - term_mode
--  c - command_mode

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Leader
map("n", "<Bslash>", "", { desc = "LEADER" })
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Buffers
map("n", "<Tab>", "<cmd>bn<CR>", { desc = "Buffer [Next]" })
map("n", "<S-Tab>", "<cmd>bp<CR>", { desc = "Buffer [Prev]" })
map("n", "<C-'>", "<cmd>b#<CR>", { desc = "Buffer [To last]" })
map("n", "<C-q>", "<cmd>bdelete<CR>", { desc = "Buffer [Delete]" }) -- :bd!<CR>
map("n", "<C-^>", "<cmd>e #<CR>", { desc = "Alternate file" }) -- :help alternate-file

-- Clipboard
map("n", "y", "\"+y", { desc = "Yank [Global]" })
map("v", "y", "\"+y", { desc = "Yank [Global]" })
--map("n", "<leader>p", "\"_dp", { desc = "Paste" })

-- Gitsigns
map("n", "<leader>gg", "<cmd>Gitsigns toggle_signs<CR>:Gitsigns toggle_numhl<CR>:Gitsigns toggle_current_line_blame<CR>", { desc = "Gitsigns" })
--map("n", "<leader>gs", "<cmd>Gitsigns toggle_signs<CR>", { desc = "Signs" })
--map("n", "<leader>gn", "<cmd>Gitsigns toggle_numhl<CR>", { desc = "Numhl" })
--map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Blame" })

-- Highlights
map("n", "<C-c>", "<cmd>nohl<CR>", { desc = "Clear [Highlight]" })
--map("n", "<leader>br", [[<cmd>%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]<CR>, { desc = "" })

-- Lines (Indent)
map("v", "<", "<gv", { desc = "Indent [Left]" })
map("v", ">", ">gv", { desc = "Indent [Left]" })

-- Lines (Misc)
map("n", "J", "mzJ`z", { desc = "Append line below" })

-- Lines (Move)
-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
map("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move [Up]" })
map("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move [Down]" })
map("x", "K", ":move '<-2<CR>gv=gv", { desc = "Block [Move Up]" })
map("x", "J", ":move '>+1<CR>gv=gv", { desc = "Block [Move Down]" })
--map("n", "J", "<cmd>move .+1<CR>", { desc = "Line [Move Down]" })
--map("n", "K", "<cmd>move .-2<CR>", { desc = "Line [Move Up]" })

-- Markdown
map("n", "<leader>lmp", "<cmd>MarkdownPreview<CR>", { desc = "Preview" })
map("n", "<leader>lms", "<cmd>MarkdownPreviewStop<CR>", { desc = "Preiview Stop" })
map("n", "<leader>lmt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Preiview Toggle" })

-- Macro
map("n", "Q", "@qj", { desc = "Macro Replay" })
map("x", "Q", ":norm @qj<CR>", { desc = "Macro Replay [Block]" })

-- Navigation
-- Conflicts with cursor scrolloff
map("n", "<C-d>", "<C-d>zz<CR>", { desc = "Page down" })
map("n", "<C-u>", "<C-u>zz<CR>", { desc = "Page up" })

-- Search
map("n", "*", "*N", { desc = "Find word" }) -- Fix * - don't move to next match
map("n", "n", "nzzzv", { desc = "Search [Next]" }) -- Fix n: keep cursor in center
map("n", "N", "Nzzzv", { desc = "Search [Previous]" }) -- Fix N: keep cursor in center

-- Shell movements
map("i", "<C-A>", "<ESC>I", { desc = "Jump EOL" })
map("i", "<C-E>", "<ESC>A", { desc = "Jump BOL" })

-- Splits (Ctrl + w)
map("n", "<C-k>", "<C-w>k", { desc = "Split [Up]" })
map("n", "<C-j>", "<C-w>j", { desc = "Split [Down]" })
map("n", "<C-h>", "<C-w>h", { desc = "Split [Left]" })
map("n", "<C-l>", "<C-w>l", { desc = "Split [Right]" })
map("n", "<C-A-k>", "<cmd>resize -5<CR>", { desc = "Split [Hor -]" })
map("n", "<C-A-j>", "<cmd>resize +5<CR>", { desc = "Split [Hor +]" })
map("n", "<C-A-h>", "<cmd>vertical resize -5<CR>", { desc = "Split [Ver +]" })
map("n", "<C-A-l>", "<cmd>vertical resize +5<CR>", { desc = "Split [Ver -]" })

-- Undo & Redo
map("n", "<u>", "<cmd>undo<CR>", { desc = "Undo" }) -- Undo
map("n", "<C-r>", "<cmd>redo<CR>", { desc = "Redo" }) -- Redo

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
--map("o", "A", "<cmd><C-U>normal! mzggVG<CR>`z")
--map("x", "A", "<cmd><C-U>normal! ggVG<CR>")
