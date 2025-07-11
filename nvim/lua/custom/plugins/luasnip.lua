-- Luasnip
-- https://github.com/L3MON4D3/LuaSnip
-- https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua
-- https://github.com/saadparwaiz1/cmp_luasnip
-- `:h luasnip.txt`

return {
  {
    "L3MON4D3/LuaSnip",
    -- dependencies = { "saadparwaiz1/cmp_luasnip" },
    lazy = true,
    event = { "InsertEnter" },
    config = function()
      local ls = require("luasnip")
      local types = require("luasnip.util.types")

      -- Config {{{
      -- `:h luasnip-config-options`
      ls.setup({
        keep_roots = true,
        link_roots = true,
        exit_roots = true,
        link_children = true,
        update_events = "TextChanged,TextChangedI",  -- `:h events`
        delete_check_events = "TextChanged",
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "󰁎", "GruvboxOrange" } }
            }
          }
        },
        ext_base_prio = 300,
        ext_prio_increase = 1,
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
        ft_func = function()
          return vim.split(vim.bo.filetype, ".", true)
        end
      })
      -- }}}

      -- Keymaps {{{
      -- https://github.com/L3MON4D3/LuaSnip/#keymaps
      -- Jump [forward]
      vim.keymap.set({ "i", "s" }, "<c-l>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      -- Jump [backward]
      vim.keymap.set({ "i", "s" }, "<c-h>", function()
        if ls.jumpable() then
          ls.jump(-1)
        end
      end, { silent = true })

      -- Choice [+]
      vim.keymap.set("i", "<c-k>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end)

      -- Choice [-]
      vim.keymap.set({ "i" }, "<c-j>", function()
        if ls.choice_active() then
          ls.change_choice(-1)
        end
      end)

      -- Reload snippets <Ctrl-u>
      -- vim.keymap.set({ "i", "s" }, "<c-u>", "<cmd>source ~/.config/nvim/lua/user/plugins/luasnip.lua<CR>")
      -- }}}

      -- Source snippets {{{
      -- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#lua
      require("luasnip.loaders.from_lua").load({
        paths = "~/.config/nvim/snippets/"
      })
      -- }}}
    end
  }
}
