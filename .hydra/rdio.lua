-- Helper functions for controlling Rdio via AppleScript
--
-- Based off of https://github.com/af/dotfiles/blob/master/hydra/itunes.lua
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
  local artwork = ext.rdio.tell('get the artwork of the current track')
  hydra.alert(track .. '\n' .. album .. '\n' .. artist, 1.5);
  -- notify.show(track .. ' - ' .. artist, album, '', '') -- notification center notification
end
