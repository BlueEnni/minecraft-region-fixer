#!/bin/bash
for ((i = 0 ; i < 2 ; i++)); do
    printf "For Scanning the World enter: 1\n For Scanning and deleting corrupted files enter: 2\n For replacing chunks or regionfiles with backupfiles enter: 3\n Exit by entering: 4\n"
    read input
    if [[ $input == "1" ]] ; then
            echo "python3 regionfixer.py -p 4 /data/world";
			$(echo "python3 regionfixer.py -p 4 /data/world");
            i=0;
	elif [[ $input == "2" ]] ; then
            echo "python3 regionfixer.py -p 4 --delete-corrupted /data/world";
			$(echo "python3 regionfixer.py -p 4 --delete-corrupted /data/world");
            i=0;
	elif [[ $input == "3" ]] ; then
            echo "Enter the path to the decompressed backup(e.g. /data/FULLBACKUP/decompressed/world)";
            read backuppath
			echo "python3 regionfixer.py -p 4 --replace-wrong --backups $backuppath /data/world";
            $(echo "python3 regionfixer.py -p 4 --replace-wrong --backups $backuppath /data/world");
            i=0;
    elif [[ $input == "4" ]] ; then
			echo "Exiting the programm..";
            i=1;
	else
		echo "Wrong input!";
        i=0;
	fi;
done


