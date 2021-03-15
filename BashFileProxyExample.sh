#!/bin/bash
# 
# Title: Bash Proxy File Example
# Author: TheStig@secplugs.com
# 
# Purpose: This example submits a file for scanning using the proxy services
#
# Concepts: Secplugs proxy service
# 


# Usage
if [[ $# -ne 1 ]] 
then 
    echo "Usage: BashFileProxyExample.sh <path to file>"
    SCAN_FILE_PATH='/tmp/eicar.com'
    echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*' >> "${SCAN_FILE_PATH}"
    echo "Defaulting to ${SCAN_FILE_PATH}"
else

  SCAN_FILE_PATH=$1

fi

# This is the default anonymous api key
# Note: The below keys are public domain and do not need to be kept secret. 
# They are protected from abuse with usage quotas.
TEST_API_KEY=r2iKI4q7Lu91Nu5uPl3eW3BPmRo4XK1ZbhLWtOKd

# The proxy api and file upload endpoint
PROXY_API='https://filescan.balachandran.org'
FILE_UPLOAD_ENDPOINT='/file/upload'

echo "This example will send the specified file '$SCAN_FILE_PATH' for analysis, wait for the results and print a summary."
echo ""
echo "Submitting file '${SCAN_FILE_PATH}' for analysis.."

# Temp file for the json results
JSON_RESULTS_PATH="/tmp/BashFileProxyExample${RANDOM}.json"

curl -XPOST "${PROXY_API}${FILE_UPLOAD_ENDPOINT}" -F "file=@${SCAN_FILE_PATH}" >> ${JSON_RESULTS_PATH}
  
echo "Done."

# Display results
REPORT_ID=$(cat ${JSON_RESULTS_PATH} | jq -r '.report_id')
echo "--- Report Summary ---"
echo -n "status: " && cat ${JSON_RESULTS_PATH} | jq -r '.status'
echo -n "verdict: " && cat ${JSON_RESULTS_PATH} | jq -r '.verdict'
echo -n "score: " && cat ${JSON_RESULTS_PATH} | jq -r '.score'
echo -n "duration: " && cat ${JSON_RESULTS_PATH} | jq -r '.duration'
echo -n "vendor: " && cat ${JSON_RESULTS_PATH} | jq -r '.meta_data.vendor_info.vendor'
echo "Full results written to ${JSON_RESULTS_PATH}"
echo "Full Report: https://secplugs.com/plugin_landing/viewreport.php?report_id=${REPORT_ID}"
echo ""
  
