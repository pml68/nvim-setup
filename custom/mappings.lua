local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scope);
        sidebar.open();
      end,
      "Open debugging sidebar",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require('dap-go').debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function ()
        require('dap-go').debug_last()
      end,
      "Debug last go test",
    },
    ["<leader>gaj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add JSON struct tags",
    },
    ["<leader>gay"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add YAML struct tags",
    },
  },
}

function starting()
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, pos) .. '<' .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end

M.cpp = {
  plugin = true,
  n = {
    ["<leader>s"] = {
      "<cmd> lua starting() <CR>",
      "Insert < sign"
    }
  },
}

return M
