-- nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp

-- Require
local cmp = require'cmp'
local luasnip = require("luasnip")

-- SuperTab (check backspace)
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getlin("."):sub(col, col):match "%s"
end

-- Kind icons
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

-- Luasnip (Tab)
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- CMP Setup
-- https://github.com/hrsh7th/nvim-cmp#setup
cmp.setup({

  -- Snippet
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Luasnip
    end,
  },

  -- Window
  window = {
    completion = {
      col_offset = 1,
      side_padding = 0,
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    },
    -- documentation = cmp.config.window.bordered(),
    -- completion = cmp.config.window.bordered(),
  },

  -- View
  view = {
    entries = "custom",
    selection_rder = "near_cursor" -- custom/wildmenu/native
  },

  -- Mapping
  mapping = {

    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept selected item. 'false' confirms explicitly selected items.

    -- Luasnips
    -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
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
    ['<C-h>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}), -- Scroll docs
    ['<C-l>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}), -- Scroll docs
    ['<C-c>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }), -- Close
    -- ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    -- ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
  },

  -- Sources
  sources = cmp.config.sources({
    { name = 'luasnip', max_item_count = 5 },
    { name = 'nvim_lsp', max_item_count = 15 },
    { name = 'buffer', keyword_length = 3 , max_item_count = 3 },
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
-- https://github.com/hrsh7th/nvim-cmp#setup
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
  })
})

-- `/` & `?` completions
-- https://github.com/hrsh7th/cmp-cmdline#setup
-- Conflicts with `native_menu`
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- `:` completions
-- https://github.com/hrsh7th/cmp-cmdline#setup
-- Conflicts with `native_menu`
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
