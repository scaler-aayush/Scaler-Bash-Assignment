#script code for question 1
#!/bin/bash

# Check if a log file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

# Assign the log file path from the argument
log_file="$1"

# Check if the log file exists and is readable
if [ ! -f "$log_file" ] || [ ! -r "$log_file" ]; then
    echo "Error: Log file '$log_file' not found or not readable."
    exit 1
fi

# Total Requests Count
total_requests=$(wc -l < "$log_file")

# Successful Requests Count
successful_requests=$(grep -cE 'HTTP/1.[01]" 2[0-9]{2}' "$log_file")

# Calculate Percentage of Successful Requests
success_percentage=$(awk "BEGIN {printf \"%.2f\", ($successful_requests / $total_requests) * 100}")

# Most Active User
most_active_user=$(awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')

# Output
echo "Total Requests Count: $total_requests"
echo "Percentage of Successful Requests: $success_percentage%"
echo "Most Active User: $most_active_user"
