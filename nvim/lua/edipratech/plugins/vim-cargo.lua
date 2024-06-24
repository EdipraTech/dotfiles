local status, vimcargo = pcall(require, "vim-cargo")
if not setup then
    return
end

vimcargo.setup()
