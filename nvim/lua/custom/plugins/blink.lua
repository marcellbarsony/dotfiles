-- Blink.cmp
-- https://github.com/Saghen/blink.cmp
-- https://cmp.saghen.dev/

return {
  {
    "saghen/blink.cmp",
    version = "*",
    event = { "InsertEnter", "CmdlineEnter" },
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      -- Appearance {{{
      -- https://cmp.saghen.dev/configuration/appearance.html
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono"
      },
      -- }}}

      -- CmdLine {{{
      -- https://cmp.saghen.dev/modes/cmdline.html
      cmdline = {
        completion = {
          menu = {
            auto_show = true
          }
        }
      },
      -- }}}

      -- Completion {{{
      -- https://cmp.saghen.dev/configuration/reference.html#completion
      completion = {
        -- Documentation {{{
        -- https://cmp.saghen.dev/configuration/reference.html#completion-documentation
        documentation = {
          auto_show = true
        },
        -- }}}

        -- Ghost text {{{
        -- https://cmp.saghen.dev/configuration/reference.html#completion-ghost-text
        ghost_text = {
          enabled = true,
          show_with_selection = true,
          show_without_selection = false,
          show_with_menu = true,
          show_without_menu = true,
        },
        -- }}}

        -- Menu {{{
        -- https://cmp.saghen.dev/configuration/reference.html#completion-menu-draw
        menu = {
          draw = {
            padding = 0,
            columns = {
              { 'label', 'label_description', gap = 1 },
              { 'kind_icon' }
            },
          }
        }
        -- }}}
      },
      -- }}}

      -- Keymap {{{
      keymap = {
        preset = "none",
        ['<CR>'] = { 'accept', 'fallback' },

        ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },

        -- Documentation
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

        -- Show & Hide
        ["<C-space>"] = { function(cmp) cmp.show({ providers = { "snippets" } }) end },
        ["<C-c>"] = { "hide" },

      },
      -- }}}

      -- Snippets {{{
      -- https://cmp.saghen.dev/configuration/reference.html#snippets
      snippets = {
        preset = "luasnip"
      },
      -- }}}

      -- Signature {{{
      -- https://cmp.saghen.dev/configuration/signature.html
      -- Experimental
      signature = {
        enabled = true
      },
      -- }}}

      -- Sources {{{
      sources = {
        default = { "snippets", "lsp", "path", "buffer" },
      },
      -- }}}
    },
    opts_extend = { "sources.default" }
  }
}
