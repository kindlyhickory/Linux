#!/bin/bash
cat <<EOF
This script will remove all empty lines from the "File_to_edit", make lowercase letters uppercase and save the modified "edited_file"
How to use this script:
./tr2.sh File_to_edit edited_file

EOF

tr -s '\n' < $1 | tr "[:lower:]" "[:upper:]" > $2 

