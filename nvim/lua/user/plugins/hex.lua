-- HEX
-- https://github.com/RaafatTurki/hex.nvim

require 'hex'.setup {

  -- cli command used to dump hex data
  dump_cmd = 'hx',

  -- cli command used to assemble from hex data
  assemble_cmd = 'hx -r',
  
  -- function that runs on BufReadPre to determine if it's binary or not
  is_buf_binary_pre_read = function()
    -- logic that determines if a buffer contains binary data or not
    -- must return a bool
  end,

  -- function that runs on BufReadPost to determine if it's binary or not
  is_buf_binary_post_read = function()
    -- logic that determines if a buffer contains binary data or not
    -- must return a bool
  end,
}
