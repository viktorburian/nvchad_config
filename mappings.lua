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
        },
        ["<leader>rcp"] = {
            function ()
                require("crates").show_crate_popup()
            end,
            "Show popup"
        }
    }
}

M.git = {
    n = {
        ["<leader>gg"] = {
            "<cmd> LazyGit <CR>",
            "Open LazyGit"
        }
    }
}

return M
