FROM rclone/rclone:1.58.1 AS upstream

FROM library/debian:stable-20211011-slim

RUN apt-get update && apt-get install -y \
  ca-certificates \
  direvent \
  diffutils \
  && rm -rf /var/lib/apt/lists/*

COPY --from=upstream /usr/local/bin/rclone /usr/local/bin/
COPY ./files /app

ENTRYPOINT [ "/usr/bin/direvent", "-f", "/app/direvent.conf" ]
