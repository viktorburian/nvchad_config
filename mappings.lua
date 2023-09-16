local M = {}

M.disabled = {
    n = {
        ["<C-h>"] = "",
        ["<C-j>"] = "",
        ["<C-k>"] = "",
        ["<C-l>"] = "",
    }
}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Toggle Breakpoint",
        },
        ["<leader>dr"] = {
            "<cmd> DapContinue <CR>",
            "Start or Continue",
        },
    }
}

M.crates = {
    n = {
        ["<leader>rcu"] = {
            function ()
                require("crates").upgrade_all_crates()
            end,
            "Update crates"
        }
    }
}

return M
