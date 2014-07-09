dofile(package.searchpath("grid", package.path))
dofile(package.searchpath("update", package.path))
dofile(package.searchpath("menuconf", package.path))
dofile(package.searchpath("itunes", package.path))
dofile(package.searchpath("rdio", package.path))

-- open hydra on startup
autolaunch.set(true)

hydra.alert("Hydra, at your service.", 1.5)

-- watch './hydra' for config updates
pathwatcher.new(os.getenv("HOME") .. "/.hydra/", hydra.reload):start()

-- set common key combinations
local bangers = {"cmd", "alt", "shift"}
local mash = {"cmd", "alt", "ctrl"}

-- open REPL
hotkey.bind(mash, "E", repl.open)

-- open dictionary
local function opendictionary()
  hydra.alert("Lexicon, at your service.", 0.75)
  application.launchorfocus("Dictionary")
end

-- open calculator
local function opencalculator()
  hydra.alert("Calculator, at your service.", 0.75)
  application.launchorfocus("Calculator")
end

-- move the window to the right half of the screen
function movewindow_righthalf()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.w = newframe.w / 2
  newframe.x = newframe.w
  win:setframe(newframe)
end

-- move the window to the left half of the screen
function movewindow_lefthalf()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.w = newframe.w / 2
  win:setframe(newframe)
end

hotkey.new(mash, "R", movewindow_righthalf):enable()
hotkey.new(mash, "L", movewindow_lefthalf):enable()

hotkey.bind(mash, "D", opendictionary)
hotkey.bind(mash, "C", opencalculator)

hotkey.bind(mash, 'M', ext.grid.maximize_window)

hotkey.bind(mash, 'N', ext.grid.pushwindow_nextscreen)
hotkey.bind(mash, 'P', ext.grid.pushwindow_prevscreen)

hotkey.bind(bangers, 'J', ext.grid.pushwindow_down)
hotkey.bind(bangers, 'K', ext.grid.pushwindow_up)
hotkey.bind(bangers, 'H', ext.grid.pushwindow_left)
hotkey.bind(bangers, 'L', ext.grid.pushwindow_right)

hotkey.bind(mash, 'U', ext.grid.resizewindow_taller)
hotkey.bind(mash, 'O', ext.grid.resizewindow_wider)
hotkey.bind(mash, 'I', ext.grid.resizewindow_thinner)
hotkey.bind(mash, 'Y', ext.grid.resizewindow_shorter)

hotkey.bind(bangers, 'P', ext.rdio.play)
hotkey.bind(mash, 'UP', ext.rdio.play)
hotkey.bind(mash, 'DOWN', ext.rdio.pause)
hotkey.bind(mash, 'LEFT', ext.rdio.previous)
hotkey.bind(mash, 'RIGHT', ext.rdio.next)
hotkey.bind(mash, '/', ext.rdio.currentTrack)

-- open/focus applications
hotkey.bind({"ctrl"}, '3', function() application.launchorfocus("Firefox") end)
hotkey.bind({"ctrl"}, '4', function() application.launchorfocus("Microsoft Outlook") end)
hotkey.bind({"ctrl"}, '5', function() application.launchorfocus("iTerm") end)
hotkey.bind({"ctrl"}, '6', function() application.launchorfocus("Campfire") end)
hotkey.bind({"ctrl"}, '7', function() application.launchorfocus("Rdio") end)
hotkey.bind({"ctrl"}, '8', function() application.launchorfocus("Dictionary") end)
hotkey.bind({"ctrl"}, '8', function() application.launchorfocus("Calculator") end)
