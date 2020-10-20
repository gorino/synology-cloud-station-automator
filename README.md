## Clone Software Needed to sync from NAS
Open the standard MacOs Terminal app and run the following to setup your MacBook Pro.
```
$ git clone https://github.com/gorino/macos-config.git ~/macos-config; ~/macos-config/run.sh
```
The script will download Synology Cloud Station 4.3.3-4469, install the pkg and open the UI.
The sync should be configured to `~/Files` local folder.
Once the sync has completed the script `~/Files/Code/TerminalSettings/install` will be run.

### What will be installed
* Oh My Zsh with Autosuggestion, Completions, Powerlevel10k, Meslo LG Nerd Font
* Homebrew
* iTerm2 with an optimized custom profile (color, keys, etc)
* Python3
* Virtualenv
* Google Cloud SDK
* Symlynk .bigqueryrc, .config/, .ssh/
* 1Password CLI
* neofetch
* colorls
* dockutil
* mas

### Dock
1) Finder (default, not installed)
2) Google Chrome
3) Microsoft Outlook
4) Fantastical
5) Todoist
6) Slack
7) Microsoft Teams
8) 1Password
7) Notes (default, not installed)
8) SublimeText 3
9) iTerm 2
---
1) Gucci
2) Temp
3) Downloads

### Other Apps Installed
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
* Cyberduck
* VLC
* Transimission
* Microsoft Excel
* Microsoft Word
* Microsoft PowerPoint
* The Unarchiver
* Magnet
* Pocket
* Trello
