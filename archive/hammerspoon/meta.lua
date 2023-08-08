-- Help for HS devolpment
local crash = require("hs.crash")
local window = require("hs.window")
local application = require("hs.application")
local logger = require("hs.logger")
local timer = require("hs.timer")
local ipc = require("hs.ipc")
local alert = require("hs.alert")
local logger = require("hs.logger")

-- local requirePlus = require("utils.require")

-- TODO: modularise it, only contain essential setup stuff here

_asm = {} -- TODO: ?
_asm.hs_default_require = require
require = rawrequire

-- Make the console dark
hs.console.darkMode(true)

-- Link Spoons dir
-- TODO: doesn't work
-- package.path = hs.configdir .. "/Spoons/?.spoon/init.lua;"

-- Override print so that it can render styled text objects directly in the console
-- this needs to happen before hs.ipc is loaded since it also overrides print for mirroring
_asm.hs_default_print = print
-- print = console.printStyledtext
-- print("-- " .. os.date()) -- Know when config gets sourced again

-- Something steals focus from an application which was focused before HS starts; capture that
-- window and then we'll switch back to it at the end
local fmW = window.frontmostWindow()

crash.crashLogToNSLog = true
crash.crashLog("Disabled require logging to make log file sane")

logger.historySize(1000)
logger.truncateID = "head"
logger.truncateIDWithEllipsis = true

window.animationDuration = 0

hs.hints.showTitleThresh = 9
hs.allowAppleScript(true)

function openConsole()
    hs.toggleConsole()
end

hs.urlevent.bind("openConsole", openConsole)

function log(message)
  if DEBUG == true then print(message) end
end
