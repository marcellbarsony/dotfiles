-- CMP
-- https://github.com/hrsh7th/nvim-cmp

-- Require
local cmp = require'cmp'
local lspkind = require'lspkind'
local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
--local cmp_ultisnips_mapping = require'cmp_ultisnips_mapping'

-- SuperTab
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

-- CMP Setup
cmp.setup({

  -- Snippet
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- UltiSnips
    end,
  },

  -- Window
  window = {
    completion = {
      col_offset = 1,
      side_padding = 0,
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    }
  },

  -- View
  view = {
    entries = "custom", selection_rder = "near_cursor" -- custom/wildmenu/native
  },

  -- Mapping (default)
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept selected item. Set `false` to confirm explicitly selected items.
  }),

  -- Sources
  sources = cmp.config.sources({
    { name = 'ultisnips' }, -- For ultisnips users.
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),

  -- Formatting
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
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

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
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

-- lspconfig setup
local nvim_lsp = require('lspconfig')
local servers = {
  'pyright',
  'pylsp',
  --'sumneko_lua',
}

-- Advertise server capabilities
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup{
    capabilities = capabilities
  }
end

