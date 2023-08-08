function reloadConfig(files)
    local doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
        hs.alert.show("Config Reloaded")
    end
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- Reload config
hs.urlevent.bind("reloadConfig", hs.reload)