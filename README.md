This file aims to help on setting up a new Mac for work.

## Clone from NAS
Open the standard MacOs Terminal app and run the followings to install Synology Cloud Drive.
```
$ git clone https://github.com/gorino/macos-config.git ~/tmp-setup
$ cd ~/tmp-setup
$ chmod +x csd_get.sh
$ ./csd_get.sh
```

##  Setup Terminal
Next step is to restore the terminal app (iTerm2) and the shell (Oh My Zsh). To do so run the followings.
```
$ cd ~/Files/Code
$ ./install_terminal
```
Then import `iterm_Profile_OhMyZsh.json` via iTerm2 > Preferences and quit iTerm to make changes effective.


## Setup Apps
Once everything is configured it's time to install most used MacOs apps. To do so run the followings.
```
$ cd ~/Files/Code
$ ./install_apps
```


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
