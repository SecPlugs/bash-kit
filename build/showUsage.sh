#!/bin/bash
# Extracts and displays usage comments from the scripts

# Do we have a file path on the command line?
if [ -z "$1"  ]
then

    # No file path - we enumerate, sort in last modified and recurse
    find . -name "*.sh" -exec ls -t "{}" + | xargs -I % ./build/showUsage.sh %

else

    # Extract lines that start with '#: '
    cat "$1" | grep '^#: ' | sed  's/^#: //g' 
   
fi