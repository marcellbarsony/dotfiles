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
      -- https://cmp.saghen.dev/configuration/reference.html#appearance
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono"
      },
      -- }}}

      -- CmdLine {{{
      -- https://cmp.saghen.dev/modes/cmdline.html
      -- https://cmp.saghen.dev/configuration/reference.html#cmdline
      cmdline = {
        enabled = true,
        keymap = {
          preset = "inherit",
        },
        sources = {
          "buffer",
          "cmdline"
        },
        completion = {
          list = {
            selection = {
              preselect = false,
              auto_insert = true,
            }
          },
          menu = {
            auto_show = true,
          },
          ghost_text = {
            enabled = true
          }
        }
      },
      -- }}}

      -- Completion {{{
      -- https://cmp.saghen.dev/configuration/completion.html
      -- https://cmp.saghen.dev/configuration/reference.html#completion
      completion = {
        -- Accept {{{
        accept = {
          auto_brackets = {
            enabled = true
          }
        },
        -- }}}

        -- Documentation {{{
        -- https://cmp.saghen.dev/configuration/completion.html#documentation
        -- https://cmp.saghen.dev/configuration/reference.html#completion-documentation
        documentation = {
          auto_show = true
        },
        -- }}}

        -- List {{{
        -- https://cmp.saghen.dev/configuration/completion.html#list
        -- https://cmp.saghen.dev/configuration/reference#completion-list
        list = {
          selection = {
            preselect = false,
            auto_insert = true
          }
        },
        -- }}}

        -- Ghost text {{{
        -- https://cmp.saghen.dev/configuration/completion.html#ghost-text
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
        -- https://cmp.saghen.dev/configuration/completion.html#menu
        -- https://cmp.saghen.dev/configuration/reference.html#completion-menu-draw
        menu = {
          auto_show = true,
          draw = {
            padding = 0,
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon" }
            }
          }
        }
        -- }}}
      },
      -- }}}

      -- Fuzzy {{{
      -- https://cmp.saghen.dev/configuration/fuzzy.html
      fuzzy = {
        sorts = {
          "exact",
          "score",
          "sort_text",
        },

      },

      -- }}}

      -- Keymap {{{
      -- https://cmp.saghen.dev/configuration/keymap.html
      keymap = {
        preset = "none",

        -- Accept
        ["<CR>"] = { "accept", "fallback" },

        -- Documentation
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },

        -- Navigation
        ["<Tab>"] = {  "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = {  "select_prev", "snippet_backward", "fallback" },

        -- Show & Hide
        ["<C-space>"] = {
          function(cmp)
            cmp.show( { providers = { "snippets" } } )
          end
        },
        ["<C-c>"] = { "hide", "fallback" },
      },
      -- }}}

      -- Snippets {{{
      -- https://cmp.saghen.dev/configuration/snippets.html
      -- https://cmp.saghen.dev/configuration/reference.html#snippets
      snippets = {
        preset = "luasnip",
      },
      -- }}}

      -- Signature {{{
      -- https://cmp.saghen.dev/configuration/signature.html
      -- https://cmp.saghen.dev/configuration/reference.html#signature
      -- Experimental
      signature = {
        enabled = true
      },
      -- }}}

      -- Sources {{{
      -- https://cmp.saghen.dev/configuration/sources.html
      -- https://cmp.saghen.dev/configuration/reference.html#sources
      sources = {
        default = {
          "snippets",
          "lsp",
          "path",
          "buffer"
        },
        providers = {
          -- Prioritize snippets
          -- https://cmp.saghen.dev/configuration/reference.html#providers
          snippets = {
            score_offset = 10
          },
          -- Path completion from `cwd` instead of current buffer's directory
          -- https://cmp.saghen.dev/recipes.html#path-completion-from-cwd-instead-of-current-buffer-s-directory
          path = {
            opts = {
              get_cwd = function(_)
                return vim.fn.getcwd()
              end
            }
          }
        }
      }
      -- }}}
    }
  }
}
