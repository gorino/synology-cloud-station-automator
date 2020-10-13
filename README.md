## Clone Software Needed to sync from NAS
Open the standard MacOs Terminal app and run the followings to install Synology Cloud Drive.
```
$ git clone git@github-gorino:gorino/macos-config.git macos-config; macos-config/csd_get.sh
```

Once the app is installed you should sync the repository into `~/Files` folder. Once synced (can take hours!) you can setup terminal and install other MacOs apps.

##  Setup Terminal
Next step is to restore the terminal app (iTerm2) and the shell (Oh My Zsh). To do so run the followings and check the instructions at script end.
```
$ ~/Files/Code/install_terminal
```

The script will install:
* Homebrew
* iTerm2
* Oh My Zsh with Autosuggestion, Completions, Powerlevel10k
* Python3
* Virtualenv
* 1Password CLI
* Google Cloud SDK
* neofetch
* colorls
* dockutil
* mas
* Fonts: Meslo LG Nerd, Hack Nerd
* Symlink: zshrc, p10k.zsh, ssh/ (assuming they are into ~/Files/Code)

## Setup Apps
After installing the terminal config, it's time to install most used MacOs apps. To do so run the followings.
```
$ ~/Files/Code/install_apps
```

The script will install (with position in the dock):
* Google Chrome (2)
* Microsoft Teams (4)
* SublimeText (7)
* Adobe Creative Cloud
* AppCleaner
* DBNgin
* Postman
* Tableau 2020.2
* TunnelBlick
* YemuZip
* Virtualbox
* Virtualbox Extension Pack
* Disk Inventory X
* Cyberduck (9)
* VLC
* Transimission
* 1Password (5)
* Outlook (3)
* Excel
* Word
* PowerPoint
* Slack (4)
* The Unarchiver
* Magnet
* Pocket
* Trello

The dock will also have Finder (1), iTerm (8), "Work", Temp and Download folders before the Trash.
