# Incident Report

Incident: Health check failed due to bad code in app.py.
Detection: CI red in deploy workflow.
Rollback: git revert HEAD, push, redeploy.
Steps: 1. Reviewed Actions logs. 2. Reverted commit. 3. Verified green CI.
