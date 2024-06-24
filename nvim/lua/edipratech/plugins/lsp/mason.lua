local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "cmake",
        "jedi_language_server",
        "pylsp",
        "rust_analyzer",
        "jdtls",
        "kotlin_language_server"
    },
    automatic_installation = true,
})
