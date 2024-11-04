-- Mason-DAP
-- https://github.com/jay-babu/mason-nvim-dap.nvim

return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    config = function ()
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "python",      -- debugpy
          "codelldb",    -- c, c++, rust, zig
        },
        -- Handlers {{{
        -- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb)
        -- https://github.com/vadimcn/codelldb/blob/master/MANUAL.md
        handlers = {
          -- Default {{{
          function(config)
            require('mason-nvim-dap').default_setup(config)
          end,
          -- }}}

          -- Codelldb {{{
          codelldb = function(config)
            config.adapters = {
              label = "Teszt",
              name = "Launch file",
              console = "integratedTerminal",
              type = "codelldb",
              request = "launch",
              program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
              end,
              cwd = '${workspaceFolder}',
              stopOnEntry = false,
            }
            require('mason-nvim-dap').default_setup(config) -- don't forget this!
          end,
          -- }}}
        },
        -- }}}
      })
      -- }}}
    end
  },
}
