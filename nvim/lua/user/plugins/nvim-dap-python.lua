-- Nvim DAP Python
-- https://github.com/mfussenegger/nvim-dap-python

-- Adapter setup
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

  table.insert(require('dap').configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'Custom launch configuration',
    program = '${file}',
    -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings

})

-- Test framework
--require('dap-python').test_runner = 'pytest' -- [django/pytest/unittest]

