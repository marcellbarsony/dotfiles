-- Hex
-- `:h hex.nvim`
-- https://github.com/RaafatTurki/hex.nvim

return {
  {
    "RaafatTurki/hex.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
      -- Dump to hex
      dump_cmd = "xxd -g 1 -u",

      -- Assemble from hex
      assemble_cmd = "xxd -r",

      -- Run on BufReadPre to determine if it's binary or not
      is_buf_binary_pre_read = function()
        -- logic that determines if a buffer contains binary data or not
        -- must return a bool
      end,

      -- Run on BufReadPost to determine if it's binary or not
      is_buf_binary_post_read = function()
        -- logic that determines if a buffer contains binary data or not
        -- must return a bool
      end
    }
  }
}
