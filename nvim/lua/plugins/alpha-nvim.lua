-- Alpha-nvim
-- https://github.com/goolord/alpha-nvim

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Header
dashboard.section.header.val = {

--"                                                     ",
--"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
--"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
--"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
--"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
--"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
--"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
--"                                                     ",

"            ██████            ",
"        ████▒▒▒▒▒▒████        ",
"      ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██      ",
"    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    ",
"  ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒      ",
"  ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓  ",
"  ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓  ",
"██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██",
"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
"██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██",
"████  ██▒▒██  ██▒▒▒▒██  ██▒▒██",
"██      ██      ████      ████",

--"            ██████                                  ██████                      ",
--"        ████▒▒▒▒▒▒████                          ████▒▒▒▒▒▒████                  ",
--"      ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                      ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                ",
--"    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓              ",
--"  ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓                ",
--"  ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓                  ",
--"  ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓             ▒▒▓▓▓▒▒",
--"██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓               ▓▓▓▓▓▓▓",
--"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓             ▒▒▓▓▓▒▒",
--"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓                  ",
--"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓                ",
--"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓              ",
--"██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                ",
--"████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                  ████▒▒▒▒▒▒████                  ",
--"██      ██      ████      ████                      ██████                      ",

--"                   -`                   ",
--"                  .o+`                  ",
--"                 `ooo/                  ",
--"                `+oooo:                 ",
--"               `+oooooo:                ",
--"               -+oooooo+:               ",
--"             `/:-:++oooo+:              ",
--"            `/++++/+++++++:             ",
--"           `/++++++++++++++:            ",
--"          `/+++ooooooooooooo/`          ",
--"         ./ooosssso++osssssso+`         ",
--"        .oossssso-````/ossssss+`        ",
--"       -osssssso.      :ssssssso.       ",
--"      :osssssss/        osssso+++.      ",
--"     /ossssssss/        +ssssooo/-      ",
--"   `/ossssso+/:-        -:/+osssso+-    ",
--"  `+sso+:-`                 `.-/+oso:   ",
--" `++:.                           `-/+/  ",
--" .`                                 `/  ",

}

-- Menu
dashboard.section.buttons.val = {
  dashboard.button( "f", "󰈔  > File [New]", ":ene <BAR> startinsert <CR>"),
  dashboard.button( "l", "󰐱  > Lazy", ":Lazy<CR>"),
  dashboard.button( "m", "󱎥  > Mason", ":Mason<CR>"),
  dashboard.button( "nh", "✚  > Nvim [Health]", ":checkhealth<CR>"),
  dashboard.button( "nn", "󱀁  > Nvim [News]", ":help news<CR>"),
  dashboard.button( "q", "  > Quit", ":qa<CR>"),
  dashboard.button( "r", "  > Recent", ":Telescope oldfiles<CR>"),
  dashboard.button( "tt", "󰭎  > Telescope", ":Telescope<CR>"),
  dashboard.button( "tf", "󰍉  > Telescope [Find files]", ":Telescope find_files<CR>"),
  dashboard.button( "tg", "󰭎  > Telescope [Grep]", ":Telescope live_grep<CR>"),
  dashboard.button( "tu", "󰍉  > Telescope [Git files]", ":Telescope git_files<CR>"),
  dashboard.button( "-", "o  > Oil", ":Oil<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
