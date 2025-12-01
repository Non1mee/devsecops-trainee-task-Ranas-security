# devsecops-trainee-task-Ranas-security

## Task 1 Log checker

The `log_checker.sh` script analyzes a log file and counts:

- Total number of lines
- Number of lines containing `INFO`
- Number of lines containing `WARN`
- Number of lines containing `ERROR`

## Usage

1. Make the script executable:
 
 chmod +x log_checker.sh

2. Run the script with a log file:

 ./log_checker.sh example.log

3. Sample Output
Total lines: 7
INFO lines: 3
WARN lines: 2
ERROR lines: 1

## Task 2 Non root container script

The print_info.py script prints:

Current username

Current working directory

Value of the APP_ENV environment variable (or development if not set)

Dockerfile

Uses a minimal base image: python:3.12-slim

Creates a non root user appuser

Sets working directory /app

Runs print_info.py as appuser

Build and Run

Build the Docker image:

docker build -t task2_image .


Run the container with a custom APP_ENV:

docker run --rm -e APP_ENV=production task2_image

Sample Output
Current user: appuser
Current directory: /app
APP_ENV: production

## Task 3  Git Workflow

At least 3 meaningful commits were made:

feat: add log checker script
feat: add containerized env info script
docs: update README with usage examples

## Task 4  Security Notes

All security notes are in a separate file SECURITY_NOTES.md.
It contains recommendations for safe Docker usage and minimizing risks when running images from the internet.

## Update – What was changed

- Added proper `.gitignore`
- Cleaned repository from temporary files
- Improved `log_checker.sh`:
  - Better formatting and error handling
  - Statistics mode (counts INFO/WARN/ERROR)
  - Exit code 1 if any ERROR line found (perfect for CI)
  - Exit code 0 if no errors
- Added GitHub Actions workflow `.github/workflows/log-check.yml`:
  - Runs on every push & PR
  - Fails the whole CI if `example.log` contains the word ERROR
EOF

## Tools used

Parrot OS / Ubuntu
Bash, Python 3.12, Docker
Git + GitHub Actions 
