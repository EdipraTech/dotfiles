local setup, autopairs = pcall(requires, "auto-pairs")
if not setup then
    return
end

autopairs.setup()
