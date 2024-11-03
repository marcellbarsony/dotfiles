-- Rustaceanvim
-- https://github.com/mrcjkb/rustaceanvim
-- `:h rustaceanvim`

return {
  {
    "mrcjkb/rustaceanvim",
    lazy = false,
    config = function()
      -- Advanced configuration
      -- https://github.com/mrcjkb/rustaceanvim#advanced-configuration
      vim.g.rustaceanvim = function()
        -- Debugging
        -- https://github.com/mrcjkb/rustaceanvim#using-codelldb-for-debugging
        local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/"
        local codelldb_path = extension_path .. "adapter/codelldb"
        local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

        -- https://github.com/mrcjkb/rustaceanvim/blob/master/lua/rustaceanvim/config/internal.lua
        local cfg = require("rustaceanvim.config")
        return {
          dap = {
            adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
          },
        }
      end
    end
  },
}
