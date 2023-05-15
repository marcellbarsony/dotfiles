-- Alpha-nvim
-- https://github.com/goolord/alpha-nvim

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Header
dashboard.section.header.val = {

"                                                     ",
"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
"                                                     ",

--"              ██████              ",
--"          ████▒▒▒▒▒▒████          ",
--"        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██        ",
--"      ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██      ",
--"    ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒        ",
--"    ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓    ",
--"    ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓    ",
--"  ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██  ",
--"  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██  ",
--"  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██  ",
--"  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██  ",
--"  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██  ",
--"  ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██  ",
--"  ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██  ",
--"  ██      ██      ████      ████  ",

}

-- Menu
dashboard.section.buttons.val = {
    dashboard.button( "a", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":cd $HOME/.local | Telescope find_files<CR>"),
    dashboard.button( "h", "✚  > Health"   , ":checkhealth<CR>"),
    dashboard.button( "l", "⚙  > Lazy"     , ":Lazy<CR>"),
    dashboard.button( "n", "n  > News"     , ":help news<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "q", "  > Quit"     , ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
