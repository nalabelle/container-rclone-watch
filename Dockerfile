FROM rclone/rclone:latest AS upstream

FROM library/debian:stable

RUN apt-get update && apt-get install -y \
  ca-certificates \
  direvent \
  diffutils \
  && rm -rf /var/lib/apt/lists/*

COPY --from=upstream /usr/local/bin/rclone /usr/local/bin/
COPY ./files /app

ENTRYPOINT [ "/usr/bin/direvent", "-f", "/app/direvent.conf" ]
