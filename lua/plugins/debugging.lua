return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        require("dapui").setup()
        --vim.keymap.set('n', '<leader>dc', function () dap.continue() end)
        --vim.keymap.set('n', '<leader>dt', function () dap.toggle_breakpoint() end)
        --vim.keymap.set('n', '<F10>', function() dap.step_over() end)
        --vim.keymap.set('n', '<F11>', function() dap.step_into() end)
        --vim.keymap.set('n', '<F12>', function() dap.step_out() end)
        --vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end)
        --vim.keymap.set('n', '<leader>B', function() dap.set_breakpoint() end)
        --vim.keymap.set('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
        --vim.keymap.set('n', '<leader>dr', function() dap.repl.open() end)
        --vim.keymap.set('n', '<leader>dl', function() dap.run_last() end)
        --vim.keymap.set({'n', 'v'}, '<leader>dh', function() require('dap.ui.widgets').hover() end)
        --vim.keymap.set({'n', 'v'}, '<leader>dp', function() require('dap.ui.widgets').preview() end)
        --vim.keymap.set('n', '<leader>df', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end)
        --vim.keymap.set('n', '<leader>ds', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end)




        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end


        dap.adapters.gdb = {
            type = "executable",
            command = "/usr/bin/gdb",
            args = { "-i", "dap" },
        }

        dap.configurations.c = {
            {
                name = "Launch file",
                type = "gdb",
                request = "launch",
                program = '${file}';
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }
        dap.configurations.cpp = dap.configurations.c

    end,
}
