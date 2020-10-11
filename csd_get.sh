# Download Cloud Station Drive DMG from Synology
curl https://global.download.synology.com/download/Tools/CloudStationDrive/4.3.3-4469/Mac/Installer/synology-cloud-station-drive-4469.dmg -o cloudstation.dmg

# Mount DMG and run the PKG installer
hdiutil attach cloudstation.dmg
sudo installer -pkg /Volumes/Synology\ Cloud\ Station\ Drive -target "/"

# Clean Stuff
hdiutil detach /Volumes/Synology\ Cloud\ Station\ Drive/
rm cloudstation.dmg

# Open Cloud Station to start configuration and sync
open /Applications/Synology\ Cloud\ Station.app
