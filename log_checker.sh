#!/bin/bash

set -euo pipefail

LOG_FILE="${1:-example.log}"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' not found!"
    exit 1
fi

TOTAL=$(wc -l < "$LOG_FILE")
INFO_COUNT=$(grep -c "INFO" "$LOG_FILE" || echo 0)
WARN_COUNT=$(grep -c "WARN" "$LOG_FILE" || echo 0)
ERROR_COUNT=$(grep -c "ERROR" "$LOG_FILE" || echo 0)

echo "=== Log Analysis Report ==="
echo "File       : $LOG_FILE"
echo "Total lines: $TOTAL"
echo "INFO lines : $INFO_COUNT"
echo "WARN lines : $WARN_COUNT"
echo "ERROR lines: $ERROR_COUNT"
echo "==========================="

if [ "$ERROR_COUNT" -gt 0 ]; then
    echo "Errors detected → failing with exit code 1"
    exit 1
else
    echo "No errors found → success with exit code 0"
    exit 0
fi
