local setup, emmmetvim = pcall(requires, "emmet-vim")
if not setup then
    return
end

emmetvim.setup()
