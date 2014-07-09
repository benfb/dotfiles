-- Helper functions for controlling Rdio via AppleScript
--
-- See also:
-- https://gist.github.com/rkumar/503162
-- http://dougscripts.com/rdio/itinfo/info01.php
ext.rdio = {}

function ext.rdio.tell(cmd)
  return hydra.exec('osascript -e \'tell application "Rdio" to ' .. cmd .. "'")
end

function ext.rdio.play()
  ext.rdio.tell('playpause')
  hydra.alert(' ▶', 0.5)
end

function ext.rdio.pause()
  ext.rdio.tell('pause')
  hydra.alert(' ◼', 0.5)
end

function ext.rdio.next()
  ext.rdio.tell('next track')
end

function ext.rdio.previous()
  ext.rdio.tell('previous track')
end

function ext.rdio.currentTrack()
  local artist = ext.rdio.tell('get the artist of the current track')
  local album = ext.rdio.tell('get the album of the current track')
  local track = ext.rdio.tell('get the name of the current track')
  hydra.alert(track .. '\n' .. album .. '\n' .. artist, 1.5);
end

-- NOTE: shuffle API is broken in Rdio 11, so these bindings don't work.
-- See https://discussions.apple.com/message/22870402
function ext.rdio.shuffle()
  ext.rdio.tell('set shuffle of current playlist to 1')
end

function ext.rdio.unshuffle()
  ext.rdio.tell('set shuffle of current playlist to 0')
end
