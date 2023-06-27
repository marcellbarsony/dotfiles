-- Nvim DAP
-- https://github.com/mfussenegger/nvim-dap/
-- :h dap.txt
-- :h dap-configuration


-- Adapter config



-- Debugee config




-- Client config




-- Signs config
vim.fn.sign_define('DapBreakpoint',          {text='B', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='C', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint',            {text='L', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped',             {text='→', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected',  {text='R', texthl='', linehl='', numhl=''})

-- Keymaps
--vim.keymap.set("n", "<Leader>dt", ':DapToggleBreakpoint<CR>')
--vim.keymap.set("n", "<Leader>dx", ':DapTerminate<CR>')
--vim.keymap.set("n", "<Leader>do", ':DapStepOver<CR>')
