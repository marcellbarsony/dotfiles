-- Alpha-nvim
-- https://github.com/goolord/alpha-nvim

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Header
dashboard.section.header.val = {

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

--"                                                     ",
--"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
--"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
--"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
--"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
--"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
--"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
--"                                                     ",

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
  dashboard.button( "l", "󰐱  > Lazy", ":Lazy<CR>"),
  dashboard.button( "f", "󰈔  > File", ":ene <BAR> startinsert <CR>"),
  dashboard.button( "m", "󰐱  > Mason", ":Mason<CR>"),
  dashboard.button( "h", "✚  > Nvim [Health]", ":checkhealth<CR>"),
  dashboard.button( "n", "󱀁  > Nvim [News]", ":help news<CR>"),
  dashboard.button( "q", "  > Quit", ":qa<CR>"),
  dashboard.button( "tt", "󰭎  > Telescope", ":Telescope<CR>"),
  dashboard.button( "tf", "󰭎  > Telescope [Find Files]", ":Telescope find_files<CR>"),
  dashboard.button( "tg", "󰭎  > Telescope [Git Files]", ":Telescope git_files<CR>"),
  dashboard.button( "to", "󰭎  > Telescope [Old Files]", ":Telescope oldfiles<CR>"),
  dashboard.button( "/", "󰭎  > Telescope [Grep]", ":Telescope live_grep<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
