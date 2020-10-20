#!/bin/bash
export CLOUD_STATION_DB_FILE=~/.CloudStation/data/db/file-status.sqlite
export CLOUD_STATION_TMP_DMG_FOLDER=~/macos-config
export CLOUD_STATION_TMP_DMG=${CLOUD_STATION_TMP_DMG_FOLDER}/cloudstation.dmg
export CLOUD_STATION_VOLUME_PATH=/Volumes/Synology\ Cloud\ Station\ Drive
export CLOUD_STATION_DOWNLOAD_URL=https://global.download.synology.com/download/Tools/CloudStationDrive/4.3.3-4469/Mac/Installer/synology-cloud-station-drive-4469.dmg
export CLOUD_STATION_APP=/Applications/Synology\ Cloud\ Station.app

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

get_seq() {
	sqlite3 $1 "SELECT seq FROM sqlite_sequence;"
}

get_queue() {
	sqlite3 $1 "SELECT COUNT(*) FROM fstatinfo"
}

poll_sync() {
	if [[ -f ${CLOUD_STATION_DB_FILE} ]]; then
		sync_seq=$(get_seq ${CLOUD_STATION_DB_FILE})
		echo "Last sequence: ${sync_seq}"
		while [[ $sync_seq -ne 0 ]]; do
			loading_dots "Waiting for something to sync"
			if [[ $(get_seq ${CLOUD_STATION_DB_FILE}) -ne $sync_seq ]]; then
				sync_seq=0
				echo -e "\nCloud Station Drive Started syncinc"
			fi
		done

		queue=$(get_queue ${CLOUD_STATION_DB_FILE})
		while [[ $queue -ne 0 ]]; do
			loading_dots "Waiting for sync to finish (${queue} files remaining)"
			queue=$(get_queue ${CLOUD_STATION_DB_FILE})
		done
		echo -e "\nSync completed"
	else
		echo "Cloud Station Drive database do not exist"
	fi
}

if [[ ! -f ${CLOUD_STATION_TMP_DMG} ]]; then
	echo "Download Synology Cloud Station Drive to ${CLOUD_STATION_TMP_DMG}"
	curl ${CLOUD_STATION_DOWNLOAD_URL} -o ${CLOUD_STATION_TMP_DMG}
else
	echo "Skip Download ${CLOUD_STATION_DOWNLOAD_URL}"
fi

if [[ -f ${CLOUD_STATION_TMP_DMG} ]]; then
	hdiutil attach ${CLOUD_STATION_TMP_DMG}
	sudo installer -pkg ${CLOUD_STATION_VOLUME_PATH} -target "/"
	hdiutil detach ${CLOUD_STATION_VOLUME_PATH}/
	rm -R ${CLOUD_STATION_TMP_DMG_FOLDER}
else
	echo "Not Found: ${CLOUD_STATION_TMP_DMG}"
	echo "This is not expected. Exit"
	exit 1
fi

if [[ -f ${CLOUD_STATION_APP} || -L ${CLOUD_STATION_APP} ]]; then
	open ${CLOUD_STATION_APP}
	poll_sync
else
	echo "Not Found: ${CLOUD_STATION_APP}"
	echo "This is not expected. Exit"
	exit 1
do

