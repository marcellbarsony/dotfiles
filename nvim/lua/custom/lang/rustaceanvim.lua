-- Rustaceanvim
-- https://github.com/mrcjkb/rustaceanvim
-- `:h rustaceanvim`

return {
  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
    config = function()
      -- Advanced configuration
      -- https://github.com/mrcjkb/rustaceanvim#advanced-configuration
      vim.g.rustaceanvim = function()
        -- Debugging
        -- https://github.com/mrcjkb/rustaceanvim/blob/master/lua/rustaceanvim/config/internal.lua
        -- https://github.com/mrcjkb/rustaceanvim#using-codelldb-for-debugging
        local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/"
        local codelldb_path = extension_path .. "adapter/codelldb"
        local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
        local cfg = require("rustaceanvim.config")

        return {
          dap = {
            adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path)
          },
          server = {
            -- TODO: Remove when fixed
            -- https://github.com/hrsh7th/cmp-nvim-lsp/issues/72
            capabilities = vim.lsp.protocol.make_client_capabilities(),
          },
          tools = {
            float_win_config = {
              auto_focus = true
            }
          }
        }
      end
    end
  }
}
