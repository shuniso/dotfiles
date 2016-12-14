#!/bin/bash

echo "start"

function install() {
        dir=`pwd`
        scp grop@tspujml1:/home/grop/s-isozaki/game/out/st4100/release/STBGame.apk ${dir}/
        adb install -r ${dir}/STBGame.apk
        rm ${dir}/STBGame.apk
}

while :
do
	read -p "input... : " -n 1 key

	if [[ $key == $'\x1b' ]]; then
		read -r -n 1 -s r1
		key+="$r1"
		if [[ $r1 == $'\x5b' ]]; then
			read -r -n 1 -s r2
			key+="$r2"
			if [[ $r2 == $'\x31' ]]; then
				read -r -n 1 -s r3
				key+="$r3"
			fi
		fi
	fi

	case "$key" in
		"i" ) install ;;
		"h" ) adb shell input keyevent 21 ;;
		$'\x1b\x5b\x44' ) adb shell input keyevent 21 ;;
		"j" ) adb shell input keyevent 20 ;;
		$'\x1b\x5b\x42' ) adb shell input keyevent 20 ;;
		"k" ) adb shell input keyevent 19 ;;
		$'\x1b\x5b\x41' ) adb shell input keyevent 19 ;;
		"l" ) adb shell input keyevent 22 ;;
		$'\x1b\x5b\x43' ) adb shell input keyevent 22 ;;
		"e" ) adb shell input keyevent 23 ;; 
		"" ) adb shell input keyevent 23 ;; 
		"b" ) adb shell input keyevent 4 ;;
		$'\x7f' ) adb shell input keyevent 4 ;;
		"m" ) adb shell input keyevent 82 ;;
		"x" ) adb shell input keyevent 3 ;;
		$'\x1b\x5b\x31\x7e' ) adb shell input keyevent 3 ;;
		* ) echo " --- unknown ${key} \n hex dump:"; echo "$key" | hexdump ;;
	esac
	echo ""

done
echo "end"

exit 0

