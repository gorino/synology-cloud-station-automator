## Clone Software Needed to sync from NAS
Open the standard MacOs Terminal app and run the followings to install Synology Cloud Drive.
```
$ git clone git@github-gorino:gorino/macos-config.git macos-config; macos-config/csd_get.sh
```

##  Setup Terminal
Next step is to restore the terminal app (iTerm2) and the shell (Oh My Zsh). To do so run the followings.
```
$ ~/Files/Code/install_terminal
```
Then import `iterm_Profile_OhMyZsh.json` via iTerm2 > Preferences and quit iTerm to make changes effective.

## Setup Apps
Once everything is configured it's time to install most used MacOs apps. To do so run the followings.
```
$ ~/Files/Code/install_apps
```
