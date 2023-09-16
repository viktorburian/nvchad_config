local on_atach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb'
local this_os = vim.loop.os_uname().sysname;
liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")

local options = {
    server = {
        on_atach = on_atach,
        capabilities = capabilities,
    },
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
}

return options
