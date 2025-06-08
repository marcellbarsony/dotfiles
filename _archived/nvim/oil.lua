-- Oil
-- https://github.com/stevearc/oil.nvim
-- `:h oil.txt`

return {
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    ---@module "oil"
    ---@type oil.SetupOpts
    keys = {
      { "n", "-", "<cmd>Oil<CR>", desc = "Oil" }
    },
    opts = {
      -- File explorer {{{
      default_file_explorer = true,
      -- }}}

      -- Columns {{{
      -- `:h oil-columns`
      columns = {
        "icon",
        "permissions",
        "size",
      },
      -- }}}

      -- Buffer options {{{
      -- Buffer-local options to use for oil buffers
      buf_options = {
        buflisted = false,
        bufhidden = "hide"
      },
      -- }}}

      -- Window-local options {{{
      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic"
      },
      -- }}}

      -- Options {{{
      delete_to_trash = false,
      skip_confirm_for_simple_edits = false,
      prompt_save_on_select_new_entry = true,
      cleanup_delay_ms = 2000,
      constrain_cursor = "editable",
      -- }}}

      -- LSP file methods {{{
      lsp_file_methods = {
        autosave_changes = false,
        timeout_ms = 1000
      },
      -- }}}

      -- Keymaps {{{
      -- `:h oil-actions`
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash"
      },

      use_default_keymaps = true,
      -- }}}

      -- View options {{{
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,
        is_always_hidden = function(name, bufnr)
          return false
        end,
        sort = {
          { "type", "asc" },
          { "name", "asc" }
        }
      },
      -- }}}

      -- Float {{{
      float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "none",
        win_options = {
          winblend = 0,
        },
        override = function(conf)
          return conf
        end
      },
      -- }}}

      -- Preview {{{
      preview = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = 0.9,
        min_height = { 5, 0.1 },
        height = nil,
        border = "none",
        win_options = {
          winblend = 0
        }
      },
      -- }}}

      -- Progress {{{
      -- Configuration for the floating progress window
      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        minimized_border = "none",
        win_options = {
          winblend = 0
        }
      }
      -- }}}
    }
  }
}
