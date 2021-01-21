#!/bin/sh
#
# This script should be run via curl:
#	sh -c "$(curl -fsSL https://raw.githubusercontent.com/gorino/synology-cloud-station-automator/main/install.sh)"
#
# You can tweak the install behavior by setting variables when running the script. Respects
# the following environment variables:
#	MY_CUSTOM_CMD	- path to the script to run once the Synology Cloud Station sync has completed
#

#############
# VARIABLES #
#############

# Cloud Station Database to Check
CLOUD_STATION_DB_FILE=~/.CloudStation/data/db/file-status.sqlite

# Temp files paths
CLOUD_STATION_TMP_DMG_FOLDER=~/.CloudStationAutomator
CLOUD_STATION_TMP_DMG=${CLOUD_STATION_TMP_DMG_FOLDER}/cloudstation.dmg

# Cloud Station Volume Path
CLOUD_STATION_VOLUME_PATH="/Volumes/Synology\ Cloud\ Station\ Drive\ 5"

# Cloud Station App Path on MacOs
CLOUD_STATION_APP="/Applications/Synology\ Cloud\ Station.app"

# Cloud Station dmg file download URL
# Can be updated to upgrade to a new version
CLOUD_STATION_DOWNLOAD_URL=https://global.download.synology.com/download/Utility/CloudStationDrive/4.3.3-4469/Mac/Installer/synology-cloud-station-drive-4469.dmg



#############
# FUNCTIONS #
#############

# Handle loading animation while waiting for sync
loading_dots() {
	echo -ne "$1.\r"
	sleep 0.33
	echo -ne "$1..\r"
	sleep 0.33
	echo -ne "$1...\r"
	sleep 0.33
	echo -ne "\r\033[K"
	echo -ne "$1\r"
	sleep 0.33
}

# Query sequence table to check if a new sync has started
get_seq() {
	sqlite3 $1 "SELECT seq FROM sqlite_sequence;"
}

# Query fstatinfo table to check if sync has completed
get_queue() {
	sqlite3 $1 "SELECT COUNT(*) FROM fstatinfo"
}

# Track when a sync starts and ends
poll_sync() {
	if [[ -f ${CLOUD_STATION_DB_FILE} ]]; then
		sync_seq=$(get_seq ${CLOUD_STATION_DB_FILE})
		while [[ $sync_seq -ne 0 ]]; do
			loading_dots "Waiting for something to sync"
			if [[ $(get_seq ${CLOUD_STATION_DB_FILE}) -ne $sync_seq ]]; then
				sync_seq=0
				echo -e "\nCloud Station Drive sync started"
			fi
		done

		queue=$(get_queue ${CLOUD_STATION_DB_FILE})
		while [[ $queue -ne 0 ]]; do
			loading_dots "Waiting for sync to finish. Files remaining: ${queue}"
			queue=$(get_queue ${CLOUD_STATION_DB_FILE})
		done
		echo -e "\nSync completed"
	else
		echo "Cloud Station Drive database do not exist"
	fi
}



#############
#  SCRIPT   #
#############

# Download from Cloud Station URL
if [[ ! -f ${CLOUD_STATION_TMP_DMG} ]]; then
	echo "Download Synology Cloud Station Drive to ${CLOUD_STATION_TMP_DMG}"
	mkdir ${CLOUD_STATION_TMP_DMG_FOLDER}
	curl ${CLOUD_STATION_DOWNLOAD_URL} -o ${CLOUD_STATION_TMP_DMG}
else
	echo "Skip Download ${CLOUD_STATION_DOWNLOAD_URL}"
fi

# Mount, install Cloud Station and clean tmp files
if [[ -f ${CLOUD_STATION_TMP_DMG} ]]; then
	hdiutil attach ${CLOUD_STATION_TMP_DMG}
	sudo installer -pkg ${CLOUD_STATION_VOLUME_PATH} -target "/"
	hdiutil detach ${CLOUD_STATION_VOLUME_PATH}
	rm -R ${CLOUD_STATION_TMP_DMG_FOLDER}
else
	echo "Not Found: ${CLOUD_STATION_TMP_DMG}"
	echo "This is not expected. Exit"
	exit 1
fi

# Open Cloud Station app and wait for sync to complete
if [[ -f ${CLOUD_STATION_APP} || -L ${CLOUD_STATION_APP} ]]; then
	open ${CLOUD_STATION_APP}
	poll_sync
else
	echo "Not Found: ${CLOUD_STATION_APP}"
	echo "This is not expected. Exit"
	exit 1
fi

# Run the script specified on MY_CUSTOM_CMD var
# or run the script at default location
sh -c "$(${MY_CUSTOM_CMD}:-~/Files/Code/TerminalSettings/install)"
