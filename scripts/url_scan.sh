#!/bin/bash
# 
# Concepts: Web End Points, API Keys, A synchronous
# 
#!/bin/bash
# Note the '#:' prefix below is used to extract and auto build the docs
# 
#: ### url_scan.sh - Url Analysis Script
#: Use this script for submitting urls for analysis
#: To scan a url, pass it as a parameter  
#: E.g. below shows scanning of a Secplugs test url
#: ```console
#: ./url_scan.sh https://example.com/?param=e81e043973f21d036e39fe
#: ```


# Include utils
source "$(dirname "$0")/sp_utils.sh"

# Usage
if [[ $# -ne 1 ]] 
then 
    echo "Usage: url_scan.sh <URL>"
    TEST_URL="https://www.example.com"
    echo "Defaulting to ${TEST_URL}"
else

  TEST_URL=$1

fi

# This is the default anonymous api key
# Note: The below keys are public domain and do not need to be kept secret. 
# They are protected from abuse with usage quotas.
TEST_API_KEY=r2iKI4q7Lu91Nu5uPl3eW3BPmRo4XK1ZbhLWtOKd

# The production api
API=https://api.live.secplugs.com/security

# We'll submit to web score and web quick scan end points
ENDPOINTS=("/web/score" "/web/quickscan")

# Pull url from the command line param

TEST_URL="${TEST_URL%\"}"
TEST_URL="${TEST_URL#\"}"


echo "This example will send the specified test url '$TEST_URL' for analysis, wait for the results and print a summary."

for EP in "${ENDPOINTS[@]}"
do
  echo ""
  echo -n "Submitting URL '${TEST_URL}' for  capabilty ${EP} analysis.."
  # We will use a temp file to store the curl output
  TEMP_FILE=/tmp/BashWebExample_${RANDOM}
  curl -X GET -G ${API}${EP}  \
       --data-urlencode "url=$TEST_URL" \
       -H "Accept: application/json" \
       -H "x-api-key: ${TEST_API_KEY}" \
       --http1.1 \
       --silent > ${TEMP_FILE}
       
  echo "done."
  
  # Print the report id and status
  REPORT_ID=$(cat ${TEMP_FILE} | jq -r '.report_id')
  echo "report_id: ${REPORT_ID}"

  # Poll for the report
  echo -n "Polling for report.."
  JOB_STATUS=""
  until [[ $JOB_STATUS == "success" ]]; do  
      curl -X GET -G ${API}/report/${REPORT_ID} \
           -H "Accept: application/json" \
           -H "x-api-key: ${TEST_API_KEY}" \
           --http1.1 \
           --silent > ${TEMP_FILE}
    
    # Get the status
    JOB_STATUS=$(cat ${TEMP_FILE} | jq -r '.status')  
  done
    
  # Display results
  echo "done."
  REPORT_ID=$(cat ${TEMP_FILE} | jq -r '.report_id')
  echo "--- Report Summary ---"
  echo -n "status: " && cat ${TEMP_FILE} | jq -r '.status'
  echo -n "verdict: " && cat ${TEMP_FILE} | jq -r '.verdict'
  echo -n "score: " && cat ${TEMP_FILE} | jq -r '.score'
  echo -n "duration: " && cat ${TEMP_FILE} | jq -r '.duration'
  echo -n "vendor: " && cat ${TEMP_FILE} | jq -r '.meta_data.vendor_info.vendor'
  echo "Full results written to ${TEMP_FILE}"
  echo "Full Report: https://secplugs.com/plugin_landing/viewreport.php?report_id=${REPORT_ID}"
  echo ""
  
  
done
