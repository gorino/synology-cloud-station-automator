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
* Symlink

## Setup Apps
Once everything is configured it's time to install most used MacOs apps. To do so run the followings.
```
$ ~/Files/Code/install_apps
```
