-- Nvim DAP
-- https://github.com/mfussenegger/nvim-dap/

-- DAP adapter configuration
-- :h dap-adapters
local dap = require('dap')

dap.adapters.python = {
  type = 'executable';
  command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
  --command = os.getenv("VIRTUAL_ENV") .. "/bin/python";
  args = { '-m', 'debugpy.adapter' };
}

-- Debugee configuration
-- :h dap-configuration
dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file [dap-conf]";
    program = "${file}";
    console = "integratedTerminal";
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter than the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directory and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

-- Sign configuration
vim.fn.sign_define('DapBreakpoint',          {text='B', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='C', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint',            {text='L', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped',             {text='→', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected',  {text='R', texthl='', linehl='', numhl=''})
