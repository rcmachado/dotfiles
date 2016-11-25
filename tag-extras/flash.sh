#!/bin/bash

uninstall_flash_player() {
	curl -o /tmp/flash.dmg https://fpdownload.macromedia.com/get/flashplayer/current/support/uninstall_flash_player_osx.dmg
	hdiutil mount /tmp/flash.dmg
	"/Volumes/Flash Player/Adobe Flash Player Uninstaller.app/Contents/MacOS/Adobe Flash Player Install Manager"
	hdiutil unmount "/Volumes/Flash Player"
	rm -f /tmp/flash.dmg
}
