#!/bin/bash

if (( $# < 3 )); then
	echo "Not enough args."
	cat << EOF
To use this script:

$0 -d /directory_assignment/ file(s)_name(s)

don't specify two or more dirs
EOF
	exit 1
fi
	DCOUNT=0 
	DRCOUNT=0
	FCOUNT=0
			
for FN in $@
do
	if [[ $DCOUNT -gt 1 ]]; then
                echo "Too much directories"
                exit 2
	elif [[ $DRCOUNT -gt 1 ]]; then
		echo "Too much directories"
    		exit 2
    	fi

case $FN in
	-d)	
	let DCOUNT++
	let FN++
	;;
	/*)
	let DRCOUNT++
	DIRS+=$FN
	;;
	[!/]*)
	FILES+=$FN
	let FCOUNT++
	;;
-help|--help)
	cat << EOF
To use this script:

$0 -d /directory_assignment/ file(s)_name(s)

don't specify two or more dirs
EOF
;;
esac
done
if [[ $DRCOUNT == 0 ]]; then
	cat << EOF
Please, specify directory

To use this script:

$0 -d /directory_assignment/ file(s)_name(s)

don't specify two or more dirs
EOF
exit 4
fi
	
if [[ $DCOUNT == 1 ]]; then
	for FN in $@
	do 
	FILE=$DIRS
	case $FN in
		[!/]*[!.sh])
		touch $FILE$FN
	;;
		[!/]*.sh)
		touch $FILE$FN
		chmod +x $FILE$FN
		;;
	esac
done
fi
