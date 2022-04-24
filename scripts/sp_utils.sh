#!/bin/bash
# Common functions and globals


if [ -z "${SP_API_KEY}" ]; then 
  echo "Using default API Key"
  # Note: This is the default anonymous api key
  # The below keys are public domain and do not need to be kept secret. 
  # They are protected from abuse with usage quotas.
  SP_API_KEY=r2iKI4q7Lu91Nu5uPl3eW3BPmRo4XK1ZbhLWtOKd
fi

# The proxy api and file upload endpoint
PROXY_API='https://proxy.secplugs.com'
FILE_UPLOAD_ENDPOINT='/file/upload'

# Server side utility functions 

# Check return code and exits on failure 
function submit_file {
  
  scan_file_path=${1}
  echo "Analysing '$scan_file_path'"
  
  # Temp file for the json results
  json_results_path="/tmp/file_scan${RANDOM}.json"
  
  # Make the call
  curl -XPOST "${PROXY_API}${FILE_UPLOAD_ENDPOINT}" -F "file=@${scan_file_path}" > ${json_results_path}
    
  echo "."
  
  # Display results
  REPORT_ID=$(cat ${json_results_path} | jq -r '.report_id')
  echo ""
  echo "--- Report Summary ---"
  echo -n "Status: " && cat ${json_results_path} | jq -r '.status'
  echo -n "Verdict: " && cat ${json_results_path} | jq -r '.verdict'
  echo -n "Score: " && cat ${json_results_path} | jq -r '.score'
  echo -n "Duration: " && cat ${json_results_path} | jq -r '.duration'
  echo -n "Vendor: " && cat ${json_results_path} | jq -r '.meta_data.vendor_info.vendor'
  echo ""
  echo "Full results written to ${json_results_path}"
  echo "See full report at: https://secplugs.com/plugin_landing/viewreport.php?report_id=${REPORT_ID}"
  echo ""
  

}
