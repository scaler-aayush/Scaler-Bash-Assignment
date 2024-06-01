#script code for question 1
#!/bin/bash

# Check if the log file path is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <log-file-path>"
  exit 1
fi

LOG_FILE="$1"

# Check if the log file exists and is readable
if [ ! -f "$LOG_FILE" ] || [ ! -r "$LOG_FILE" ]; then
  echo "Error: Log file does not exist or is not readable."
  exit 1
fi

# Total Requests Count
TOTAL_REQUESTS=$(wc -l < "$LOG_FILE")
echo "Total Requests Count: $TOTAL_REQUESTS"

# Percentage of Successful Requests (HTTP status codes 200-299)
SUCCESSFUL_REQUESTS=$(grep -c 'HTTP/.* 2[0-9][0-9] ' "$LOG_FILE")
PERCENTAGE_SUCCESSFUL=$(awk "BEGIN {printf \"%.2f\", ($SUCCESSFUL_REQUESTS/$TOTAL_REQUESTS)*100}")
echo "Percentage of Successful Requests: $PERCENTAGE_SUCCESSFUL%"

# Most Active User (IP address with the most requests)
MOST_ACTIVE_USER=$(awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')
echo "Most Active User: $MOST_ACTIVE_USER"
