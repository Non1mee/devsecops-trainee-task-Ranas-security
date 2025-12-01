
set -euo pipefail

if [ $# -eq 0 ]; then

    echo "Error: No log file provided"

    echo "Usage: $0 <log-file>"

    exit 2

fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then

    echo "Error: File '$LOG_FILE' does not exist!"

    exit 2

fi

TOTAL=$(wc -l < "$LOG_FILE")

INFO_COUNT=$(grep -c "INFO"  "$LOG_FILE" || echo 0)

WARN_COUNT=$(grep -c "WARN"  "$LOG_FILE" || echo 0)

ERROR_COUNT=$(grep -c "ERROR" "$LOG_FILE" || echo 0)

echo "=== Log Analysis Report ==="

echo "File       : $LOG_FILE"

echo "Total lines: $TOTAL"

echo "INFO lines : $INFO_COUNT"

echo "WARN lines : $WARN_COUNT"

echo "ERROR lines: $ERROR_COUNT"

echo "=========================="

# Exit code logic

if [ "$ERROR_COUNT" -gt 0 ]; then

    echo "Errors detected in the log → failing with exit code 1"

    exit 1

else

    echo "No errors found → success (exit code 0)"

    exit 0

fi

