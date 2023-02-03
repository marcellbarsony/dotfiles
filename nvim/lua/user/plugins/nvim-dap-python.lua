-- Nvim DAP Python
-- https://github.com/mfussenegger/nvim-dap-python

-- Debugpy module install
-- https://github.com/mfussenegger/nvim-dap-python#debugpy
local path='~/.local/git/arch/.virtualenvs/debugpy/bin/python'
-- local path='/usr/bin/python'

-- Adapter setup
-- :h dap-configuration
require('dap-python').setup(path)

  table.insert(require('dap').configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'DAP-Python [dap-py]',
    program = '${file}',
    pythonPath = function()
      return '/usr/bin/python'
    end;
    -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings

  })

-- Test framework
--require('dap-python').test_runner = 'pytest' -- [django/pytest/unittest]

