-- CMP
-- https://github.com/hrsh7th/nvim-cmp

-- Ultisnip + cmp-cmdline
    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

-- Require
    local cmp = require'cmp'
    local lspkind = require'lspkind'

-- Kind icons
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

-- CMP
    cmp.setup({
        view = {
            entries = { name = 'custom', selection_order = 'near_cursor' }
            --entries = "native"
            --entries = "wildmenu"
        },
        snippet = {
          -- REQUIRED - Specify a snippet engine
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)                             -- ultisnips
            -- require('luasnip').lsp_expand(args.body)                     -- luasnip
            -- vim.fn["vsnip#anonymous"](args.body)                         -- vsnip
            -- require('snippy').expand_snippet(args.body)                  -- snippy
          end,
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. strings[1] .. " "
            kind.menu = "    (" .. strings[2] .. ")"

            return kind
          end,
        },
        experimental = {
            ghost_text = true,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
          },
        },
        mapping = {
            ["<Tab>"] = cmp.mapping({
                c = function()
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        cmp.complete()
                    end
                end,
                i = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                        vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
                    else
                        fallback()
                    end
                end,
                s = function(fallback)
                    if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                        vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
                    else
                        fallback()
                    end
                end
            }),
            ["<S-Tab>"] = cmp.mapping({
                c = function()
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        cmp.complete()
                    end
                end,
                i = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                        return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                    else
                        fallback()
                    end
                end,
                s = function(fallback)
                    if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                        return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                    else
                        fallback()
                    end
                end
            }),
            ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
            ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
            ['<C-n>'] = cmp.mapping({
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
            ['<C-p>'] = cmp.mapping({
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
            ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
            ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
            ['<CR>'] = cmp.mapping({
                i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
                c = function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                    else
                        fallback()
                    end
                end
            }),
            -- ... Additional mapping ...
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },                                            -- nvim_lsp
          { name = 'ultisnips' },                                           -- ultisnips
          -- { name = 'luasnip' },                                          -- luasnip
          -- { name = 'vsnip' },                                            -- vsnip
          -- { name = 'snippy' },                                           -- snippy
        }, {
          { name = 'buffer' },
        })
        })

        -- Set configuration for specific filetype
        cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' },                                             -- Specify the `cmp_git` source installed
        }, {
          { name = 'buffer' },
        })
        })

        -- Use buffer source for `/`
        cmp.setup.cmdline('/', {
          completion = { autocomplete = false },
          sources = {
            -- { name = 'buffer' }
            { name = 'buffer', opts = { keyword_pattern = [=[[^[:blank:]].*]=] } }
         }
        })

        -- Use cmdline & path source for ':'
        cmp.setup.cmdline(':', {
          completion = { autocomplete = false },
          sources = cmp.config.sources({
              { name = 'path' }
              }, {
              { name = 'cmdline' }
          })
        })

        -- lspconfig
        --local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
        --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
        --  capabilities = capabilities
        --}

-- SuperTab
    local check_backspace = function()
        local col = vim.fn.col "." - 1                                   -- Help SuperTab work better
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

