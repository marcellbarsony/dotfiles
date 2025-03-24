-- Mason-DAP
-- https://github.com/jay-babu/mason-nvim-dap.nvim

return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    config = function ()
      require("mason-nvim-dap").setup({
        automatic_installation = true,
        ensure_installed = {
          "python",    -- Debugpy
          "codelldb",  -- C, C++, Rust, Zig
        },
        -- Handlers
        -- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb)
        -- https://github.com/vadimcn/codelldb/blob/master/MANUAL.md
        handlers = {
          function(config)
            require("mason-nvim-dap").default_setup(config)
          end
        }
      })
    end
  }
}
