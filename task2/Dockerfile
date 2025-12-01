
# Use official slim Python image – small and secure base image

FROM python:3.12-slim

# Create a non-root user called "appuser" with home directory

# This is security best practice – never run containers as root

RUN useradd --create-home --shell /bin/bash appuser

# Set working directory inside the container

WORKDIR /app

# Copy only the Python script we need (keeps image small)

COPY print_info.py .

# Make script executable but not writable (defense in depth)

RUN chmod 555 print_info.py

# Switch to non-root user for all following commands and runtime

USER appuser

# What command that runs when container starts

ENTRYPOINT ["./print_info.py"]

