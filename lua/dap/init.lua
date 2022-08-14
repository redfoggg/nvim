local has_dap, dap = pcall(require, "dap")
if not has_dap then
  return
end

local map = function(lhs, rhs, desc)
  if desc then
    desc = "[DAP] " .. desc
  end
  vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end

vim.fn.sign_define("DapBreakpoint", { text = "ß", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "ü", texthl = "", linehl = "", numhl = "" })
map("<F11>", require("dap").step_into, "step_into")
map("<F10>", require("dap").step_over, "step_over")
map("<F4>", require("dap").step_out, "step_out")
map("<F5>", require("dap").continue, "continue")
map("<F9>", require("dap").toggle_breakpoint)
--map("<F9>", function()  require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ") end)

dap.adapters.coreclr = {
  type = 'executable',
  command = 'os.getenv("HOME")/.local/share/nvim/mason/bin/netcoredbg',
  args = {'--interpreter=vscode'}
}
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = "${workspaceRoot}/bin/Debug/net6.0/chapter-1-question-2.dll",
  },
}



require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})

require("nvim-dap-virtual-text").setup()
