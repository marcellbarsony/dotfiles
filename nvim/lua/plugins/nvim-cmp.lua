-- CMP
-- https://github.com/hrsh7th/nvim-cmp
-- `:h cmp`
-- `:h nvim-cmp`

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')

      -- Kind icons {{{
      -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-codicons-to-the-menu
      local kind_icons = {
        Class = "",
        Color = "",
        Constant = "",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "",
        Field = "󰽐",
        File = "",
        Folder = "",
        Function = "󰊕",
        Interface = "",
        Keyword = "󰌋",
        Method = "",
        Module = "",
        Operator = "",
        Property = "ﰠ",
        Reference = "",
        Snippet = "󱐋",
        Struct = "",
        Text = "",
        TypeParameter = "",
        Unit = "",
        Value = "",
        Variable = "󰫧",
      }
      -- }}}

      -- Luasnip (Tab) {{{
      -- Confirm candidate on `TAB` immediately when there's only one completion entry
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      -- }}}

      -- CMP Setup {{{
      -- https://github.com/hrsh7th/nvim-cmp#setup
      cmp.setup({
        -- Snippet {{{
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- Luasnip
          end,
        },
        -- }}}

        -- Window {{{
        window = {
          completion = {
            col_offset = 1,
            side_padding = 0,
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          },
          -- Border
          -- documentation = cmp.config.window.bordered {
          --   winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
          -- },
          -- completion = cmp.config.window.bordered({
          --   winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
          -- }),
        },
        -- }}}

        -- Minimum completion length {{{
        min_length = 0,
        -- }}}

        -- View {{{
        view = {
          entries = "custom",
          selection_rder = "near_cursor"
        },
        -- }}}

        -- Mapping {{{
        -- `:h ins-completion`
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({ select = false }),                            -- Accept selected
          ["<C-o>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),                 -- Open completion
          ["<C-c>"] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }), -- Close completion
          ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-5), { "i", "c" }),            -- Scroll docs [up]
          ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(5), { "i", "c" }),             -- Scroll docs [down]

          -- Luasnips
          -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          -- CMP
          ["<C-j>"] = cmp.mapping({ -- Next item
            c = function()
              if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              else
                vim.api.nvim_feedkeys(t("<Down>"), "n", true)
              end
            end,
            i = function(fallback)
              if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              else
                fallback()
              end
            end
          }),
          ["<C-k>"] = cmp.mapping({ -- Previous item
            c = function()
              if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
              else
                vim.api.nvim_feedkeys(t("<Up>"), "n", true)
              end
            end,
            i = function(fallback)
              if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
              else
                fallback()
              end
            end
          }),
        },
        -- }}}

        -- Preselect {{{
        -- :h cmp-config.preselect
        preselect = cmp.PreselectMode.None,
        -- }}}

        -- Sources {{{
        sources = cmp.config.sources({
          { name = "luasnip",  max_item_count = 3,  priority_weight = 1 },
          { name = "nvim_lsp", max_item_count = 100 },
          { name = "buffer",   max_item_count = 3, keyword_length = 3 },
        }),
        -- }}}

        -- Formatting {{{
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- Concatonate icons with item kind name
            -- Source
            vim_item.menu = ({
              buffer = "[Buf]",
              luasnip = "[Snp]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[Lua]",
              latex_symbols = "[LaTeX]",
            })[entry.source.name]
            return vim_item
          end
        },
        -- }}}

        -- Experimental {{{
        experimental = {
          ghost_text = true,
        }
        -- }}}
      })
      -- }}}

      -- CMP Setup (filetype + cmd line) {{{
      -- Specific filetypes
      -- https://github.com/hrsh7th/nvim-cmp#setup
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" },
        }, {
          { name = "buffer" },
        })
      })

      -- `/` & `?` completions
      -- Conflicts with `native_menu`
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })

      -- `:` completions
      -- Conflicts with `native_menu`
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        })
      })
      -- }}}

      -- Nvim-Autopairs {{{
      -- https://github.com/windwp/nvim-autopairs?tab=readme-ov-file#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
      -- }}}
    end,
  },
}
