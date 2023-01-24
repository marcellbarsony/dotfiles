-- Nvim DAP Python
-- https://github.com/mfussenegger/nvim-dap-python
-- :h dap-configuration

-- Debugpy module
local path='~/.local/git/arch/debugpy/bin/python'

-- Adapter setup
require('dap-python').setup(path)

  table.insert(require('dap').configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'DAP-Python',
    program = '${file}',
    pythonPath = function()
      return '/usr/bin/python'
    end;
    -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings

  })

-- Test framework
--require('dap-python').test_runner = 'pytest' -- [django/pytest/unittest]

