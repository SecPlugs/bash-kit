#!/bin/bash

# Include utils
source "$(dirname "$0")/sp_utils.sh"

# Welcome
echo "file_scan.sh - File Analysis Script"

# Look for no param case
if [[ $# -ne 1 ]] 
then 
    
    # Create an EICAR and use that
    echo "Usage: file_scan.sh <path to file or directory>"
    SCAN_FILE_PATH='/tmp/eicar.com'
    echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*' > "${SCAN_FILE_PATH}"
    echo "Defaulting to ${SCAN_FILE_PATH}"
    
    # Submit and pass on exit code
    submit_file ${SCAN_FILE_PATH}
    exit $?
    
else
  
  # Check for directory 
  if [ -d "${1}" ] ; then
      
      # Iterate directory
      echo "Analysing directory ${1}";
      for FILE in *; 
      do 
        SCAN_FILE_PATH="${1}/$FILE"
        submit_file "${SCAN_FILE_PATH}"
        
      done
      
      exit 0;
      
  
  # Check for file 
  elif [ -f "${1}" ] ; then
  
    # It is a file, submit and pass on exit code
    SCAN_FILE_PATH=$1
    submit_file ${SCAN_FILE_PATH}
    exit $?
  
  # Bad param
  else
    
    echo "Usage: file_scan.sh <path to file or directory>"
    echo "${1} does not exist"
    exit 1
    
  fi
  
fi


