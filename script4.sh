#!/bin/bash
# Script 4: Log File Analyzer
# Author: GODALA KOUSHIK REDDY (24MIP10060)
# Software: Linux Kernel
# Usage: ./script4.sh /var/log/messages error

# --- Variables ---
# $1 is the first argument (logfile), $2 is the second (keyword)
LOGFILE=${1:-"/var/log/syslog"}
KEYWORD=${2:-"error"}
COUNT=0

echo "Starting Log Analysis on: $LOGFILE"
echo "Searching for keyword: '$KEYWORD'"
echo "------------------------------------------"

# Check if the log file exists before proceeding
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

# While-read loop to process the file line by line
while IFS= read -r LINE; do
    # Search for the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# --- Summary Output ---
echo "Analysis Complete."
echo "Keyword '$KEYWORD' was found $COUNT times in $LOGFILE."
echo "------------------------------------------"

# Extra Credit: Show the last 5 occurrences using tail
echo "Last 5 matches:"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
