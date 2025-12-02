#!/bin/bash
set -euo pipefail

FILE="${1:-example.log}"

if [[ ! -f "$FILE" ]]; then
  echo "File $FILE not found!"
  exit 2
fi

TOTAL=$(wc -l < "$FILE")
INFO=$(grep -c "INFO" "$FILE" || echo 0)
WARN=$(grep -c "WARN" "$FILE" || echo 0)
ERROR=$(grep -c "ERROR" "$FILE" || echo 0)

cat <<REPORT
=== Log Analysis Report ===
File        : $FILE
Total lines : $TOTAL
INFO lines  : $INFO
WARN lines  : $WARN
ERROR lines : $ERROR
============================
REPORT

if (( ERROR > 0 )); then
  echo "Errors detected → failing with exit code 1"
  exit 1
else
  echo "No errors → success"
  exit 0
fi
