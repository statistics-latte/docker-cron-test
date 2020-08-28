# docker-cron-test
Docker cron test (on Ubuntu 18.04)

```
# Build image.
docker build -t cron-test .

# Create container.
docker run --rm --name cron-test -ti cron-test /bin/bash

# --- container ---

# exec supervisord
/usr/bin/supervisord

# Quit container (Ctrl+p, ctrl+q )

# --- host ---

# Wait a minute... then, Check logs.
docker exec cron-test watch -n 1 ls -laF /var/log/
docker exec cron-test cat /var/log/cron.log
…

# Stop (and auto remove) container
docker stop cron-test
```
