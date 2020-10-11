This file aims to help on setting up a new Mac for work.

## Clone from NAS
Open the standard MacOs Terminal app and run the following command to install Synology Cloud Drive.
```
$ curl https://global.download.synology.com/download/Tools/CloudStationDrive/4.3.3-4469/Mac/Installer/synology-cloud-station-drive-4469.dmg -o cloudstation.dmg
$ hdiutil attach cloudstation.dmg
$ sudo installer -pkg /Volumes/Synology\ Cloud\ Station\ Drive -target "/"
$ hdiutil detach /Volumes/Synology\ Cloud\ Station\ Drive/
$ rm cloudstation.dmg
$ open /Applications/Synology\ Cloud\ Station.app
```

##  Setup Terminal
Next step is to restore the terminal app (iTerm2) and the shell (Oh My Zsh). To do so run the followings.
```
$ cd ~/Files/Code
$ ./install_terminal
```
Then import iterm_Profile_OhMyZsh.json via iTerm2 > Preferences and quit iTerm to make changes effective.


## Setup Apps
Once everything is configured it's time to install most used MacOs apps. To do so run the followings.
```
$ cd ~/Files/Code
$ ./install_apps
```

## Configure Cyberduck
* Drag'n'drop `gorino-websites.duck` and `gdi-dev.duck` in Cyberduck bookmarks view.


## Adjust Dock Icons Order
* Finder
* Chrome
* Outlook
* Slack
* Teams
* 1Password
* MacOs Notes
* SublimeText
* iTerm2
* Cyberduck
* Gmail Chrome Shortcut
* MacOs Settings
