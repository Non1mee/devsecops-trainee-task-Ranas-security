# Minimal base for security
FROM alpine:3.19

# Only required pkgs
RUN apk add --no-cache bash coreutils grep

# Non-root user
RUN adduser -D appuser

WORKDIR /app

COPY log_checker.sh .

RUN chmod +x log_checker.sh

USER appuser

ENTRYPOINT ["./log_checker.sh"]
