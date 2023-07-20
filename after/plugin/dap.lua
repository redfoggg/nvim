local dap = require('dap')
local dapui = require("dapui")

dapui.setup()

-- para trabalhar com .vscode/launch.json
require('dap.ext.vscode').load_launchjs(nil, { coreclr = { 'cs' } })

dap.adapters.coreclr = {
    type = 'executable',
    command = os.getenv("HOME") .. '/.local/share/nvim/mason/bin/netcoredbg',
    args = { '--interpreter=vscode' }
}

-- só necessário se não tiver um .vscode/launch.json
--dap.configurations.cs = {
--  {
--    type = "coreclr",
--    name = "launch - netcoredbg",
--    request = "launch",
--    program = function()
--        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
--    end,
--  },
--}

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)

vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)

vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)

vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
