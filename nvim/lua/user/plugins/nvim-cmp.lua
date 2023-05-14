-- nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp

-- Require
local cmp = require'cmp'
local lspkind = require'lspkind'
local lspconfig = require'lspconfig'
local luasnip = require("luasnip") -- Luasnip
--local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings") -- Ultisnips

-- SuperTab (check backspace)
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getlin("."):sub(col, col):match "%s"
end

-- Kind Icons
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

-- -- Ultisnips
-- -- cmp-nvim-ultisnips mapping
-- local t = function(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

-- Luasnip (Tab)
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- CMP Setup
cmp.setup({

  -- Snippet
  snippet = {
    expand = function(args)
      -- vim.fn["UltiSnips#Anon"](args.body) -- Ultisnips
      require('luasnip').lsp_expand(args.body) -- Luasnip
    end,
  },

  -- Window
  window = {
    completion = {
      col_offset = 1,
      side_padding = 0,
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    }
    -- documentation = cmp.config.window.bordered(),
    -- completion = cmp.config.window.bordered(),
  },

  -- View
  view = {
    entries = "custom", selection_rder = "near_cursor" -- custom/wildmenu/native
  },

  -- Mapping (nvim-cmp ultisnips + cmp-cmdline)
  mapping = {

    -- Luasnips
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept selected item. 'false' confirms explicitly selected items.

    -- -- Ultisnips
    -- ['<CR>'] = cmp.mapping({
    --   -- Accept currently selected item. Set 'false' to confirm excplicitly selected items only
    --   i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
    --   -- When completion menu is visible select completion or expand snippet, else <CR>
    --   -- i = cmp.mapping.confirm({ select = false }),
    --   -- When completion menu is visible select completion only, don't accept line, else <CR>
    --   c = function(fallback)
    --     if cmp.visible() then
    --       -- Accept selected item
    --       cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
    --     else
    --       fallback()
    --     end
    --   end
    -- }),

    -- Luasnips
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
      -- the way you will only jump inside the snippet region
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

    --  -- Ultisnips
    --  ["<Tab>"] = cmp.mapping({
    --    c = function()
    --      if cmp.visible() then
    --        -- Insert next/prev entry
    --        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
    --      else
    --        -- Start completion
    --        cmp.complete()
    --      end
    --    end,
    --    -- Snippet (jump forward)
    --    i = function(fallback)
    --       if cmp.visible() then
    --         -- Insert next entry
    --         cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
    --       elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
    --         -- Jump to next snippet tag
    --         vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
    --       else
    --         fallback()
    --       end
    --    end,
    --    -- Snippet (jump forward)
    --    s = function(fallback)
    --      if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
    --        vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
    --      else
    --        fallback()
    --      end
    --    end
    --    }),
    --  ["<S-Tab>"] = cmp.mapping({
    --    c = function()
    --      if cmp.visible() then
    --        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
    --      else
    --        cmp.complete()
    --      end
    --    end,
    --    i = function(fallback)
    --      if cmp.visible() then
    --        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
    --      elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
    --         return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
    --      else
    --         fallback()
    --      end
    --    end,
    --    s = function(fallback)
    --      if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
    --        return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
    --      else
    --        fallback()
    --      end
    --    end
    --  }),

    -- CMP
    ['<C-j>'] = cmp.mapping({ -- Down
      c = function()
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
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
    ['<C-k>'] = cmp.mapping({ -- Up
      c = function()
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        else
          vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
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
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}), -- Open
    ['<Up>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}), -- Scroll docs
    ['<Down>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}), -- Scroll docs
    ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }), -- Close
    -- ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    -- ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }), -- Close
  },

  -- Sources
  sources = cmp.config.sources({
    { name = 'luasnip', max_item_count = 5 },
    { name = 'nvim_lsp', max_item_count = 10 },
    { name = 'buffer', keyword_length = 3 , max_item_count = 3 },
    -- { name = 'ultisnips', max_item_count = 5 },
  }),

  -- Formatting
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- Concatonate icons with item kind name
      -- Source
      vim_item.menu = ({
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snp]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end
  },
  -- Experimental
  experimental = {
    ghost_text = true,
  }
})

-- Configuration for specific filetype
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- Specify the `cmp_git` source if installed
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
