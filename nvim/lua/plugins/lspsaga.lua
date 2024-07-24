-- Lspsaga
-- https://github.com/nvimdev/lspsaga.nvim
-- https://nvimdev.github.io/lspsaga
-- https://github.com/nvimdev/lspsaga.nvim/blob/main/lua/lspsaga/init.lua

require("lspsaga").setup({
    -- {{{ Default options
    -- https://github.com/nvimdev/lspsaga.nvim#default-options
    scroll_preview = {
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    request_timeout = 2000,
    -- }}}

    -- {{{ Breadcrumbs
    -- https://nvimdev.github.io/lspsaga/breadcrumbs/
    -- }}}

    -- {{{ Callhierarchy
    -- :Lspsaga incoming_calls / outgoing_calls
    -- https://nvimdev.github.io/lspsaga/callhierarchy/
    callhierarchy = {
        show_detail = false,
        keys = {
            edit = "e",
            vsplit = "s",
            split = "i",
            tabe = "t",
            jump = "o",
            quit = "q",
            expand_collapse = "u",
        },
    },
    -- }}}

    -- {{{ Code Action
    -- :Lspsaga code_action
    -- https://nvimdev.github.io/lspsaga/codeaction/
    code_action = {
        num_shortcut = true,
        show_server_name = false,
        extend_gitsigns = true,
        only_in_cursor = true,
        max_height = 0.3,
        keys = {
            quit = "q",
            exec = "<CR>",
        },
    },
    -- }}}

    -- {{{ Definition
    -- :Lspsaga peek_definition
    -- https://nvimdev.github.io/lspsaga/definition/
    definition = {
        width = 0.6,
        height = 0.5,
        save_pos = false,
        keys = {
            edit = "<C-c>o",
            vsplit = "<C-c>v",
            split = "<C-c>i",
            tabe = "<C-c>t",
            tabnew = "<C-c>n",
            quit = "q",
            close = "<C-c>k"
        }
    },
    -- }}}

    -- {{{ Diagnostic
    -- :Lspsaga diagnostic_jump_next
    -- https://nvimdev.github.io/lspsaga/diagnostic/
    diagnostic = {
        show_code_action = true,
        show_layout = "float",
        show_normal_height = 10,
        jump_num_shortcut = true,
        max_width = 0.8,
        max_height = 0.6,
        max_show_width = 0.9,
        max_show_height = 0.6,
        text_hl_follow = true,
        border_follow = true,
        extend_relatedInformation = false,
        diagnostic_only_current = false,
        keys = {
            exec_action = "o",
            quit = "q",
            expand_or_jump = "<CR>",
            quit_in_show = { "q", "<ESC>" },
        },
    },
    -- }}}

    -- {{{ Finder
    -- :Lspsaga finder
    -- https://nvimdev.github.io/lspsaga/finder/
    finder = {
        max_height = 0.5,
        left_width = 0.3,
        right_width = 0.3,
        methods = {},
        default = "ref+imp",
        layout = "float",
        silent = false,
        filter = {},
        fname_sub = nil,
        sp_inexist = false,
        sp_global = false,
        ly_botright = false,
        keys = {
            shuttle = "[w",
            toggle_or_open = "o",
            vsplit = "s",
            split = "i",
            tabe = "t",
            tabnew = "r",
            quit = "q",
            close = "<C-c>k",
        },
    },
    -- }}}

    -- {{{ Hover
    -- :Lspasga hover_doc
    -- https://nvimdev.github.io/lspsaga/hover/
    hover = {
        max_width = 0.6,
        max_height = 0.8,
        open_link = "gx",
        open_cmd = "!xdg-open",
    },
    -- }}}

    -- {{{ LightBulb
    -- https://nvimdev.github.io/lspsaga/lightbulb/
    lightbulb = {
        enable = true,
        sign = true,
        debounce = 10,
        sign_priority = 40,
        virtual_text = false,
        enable_in_insert = true,
    },
    -- }}}

    -- {{{ Outline
    -- :Lspsaga outline
    -- https://nvimdev.github.io/lspsaga/outline/
    outline = {
        win_position = "right",
        win_width = 30,
        auto_preview = true,
        detail = true,
        auto_close = true,
        close_after_jump = false,
        layout = "normal",
        max_height = 0.5,
        left_width = 0.3,
        keys = {
            toggle_or_jump = "o",
            quit = "q",
            jump = "e",
        },
    },
    -- }}}

    -- {{{ Rename
    -- :Lspsaga rename
    -- https://nvimdev.github.io/lspsaga/rename/
    rename = {
        in_select = true,
        auto_save = false,
        project_max_width = 0.5,
        project_max_height = 0.5,
        keys = {
            quit = "<C-c>",
            exec = "<CR>",
            select = "x",
        },
    },
    -- }}}

    -- {{{ Winbar
    -- :Lspsaga symbols in winbar
    -- https://github.com/nvimdev/lspsaga.nvim#lspsaga-symbols-in-winbar
    symbol_in_winbar = {
        enable = false,
        separator = " › ",
        hide_keyword = false,
        ignore_patterns = nil,
        show_file = true,
        folder_level = 1,
        color_mode = true,
        dely = 300,
    },
    -- }}}

    -- {{{ :Lspsaga UI
    -- https://nvimdev.github.io/lspsaga/misc/
    ui = {
        border = "single",
        devicon = true,
        foldericon = true,
        title = true,
        expand = "",
        collapse = "",
        code_action = "󱐌",
        actionfix = " ",
        lines = { "┗", "┣", "┃", "━", "┏" },
        kind = nil,
        imp_sign = "󰳛 ",
    },
    -- }}}

    -- {{{ UI Beacon
    -- :Lspsaga beacon
    -- https://nvimdev.github.io/lspsaga/misc/
    beacon = {
        enable = true,
        frequency = 7,
    },
    -- }}}

    -- {{{ Implement
    implement = {
        enable = false,
        sign = true,
        lang = {},
        virtual_text = true,
        priority = 100,
    },
    -- }}}

    -- {{{ Floaterm
    floaterm = {
        height = 0.7,
        width = 0.7,
    },
    -- }}}
})
