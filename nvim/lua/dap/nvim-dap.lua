-- Nvim DAP
-- https://github.com/mfussenegger/nvim-dap/
-- :h dap.txt

-- Adapter
-- :h dap-adapter

-- Client
-- :h dap.defaults

-- Debugee
-- :h dap-configuration

-- Signs
vim.fn.sign_define('DapBreakpoint', { text = 'B', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = 'C', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = 'L', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '→', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = 'R', texthl = '', linehl = '', numhl = '' })

-- Terminal
-- h: dap-terminal
