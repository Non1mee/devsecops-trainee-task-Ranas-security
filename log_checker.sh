#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Error: No log file specified."
    exit 1
fi

LOGFILE="$1"

if [[ ! -f "$LOGFILE" ]]; then
    echo "Error: File '$LOGFILE' does not exist."
    exit 2
fi

total_lines=$(wc -l < "$LOGFILE")
info_lines=$(grep -c "INFO" "$LOGFILE")
warn_lines=$(grep -c "WARN" "$LOGFILE")
error_lines=$(grep -c "ERROR" "$LOGFILE")
echo "Total lines: $total_lines"
echo "INFO lines:  $info_lines"
echo "WARN lines:  $warn_lines"
echo "ERROR lines: $error_lines"
