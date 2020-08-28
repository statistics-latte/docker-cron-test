FROM ubuntu:18.04

# for tzdata
RUN DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Tokyo

# packages
RUN apt-get update \
  && apt-get install -y cron vim tzdata supervisor \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# cron
COPY task.sh /usr/local/bin/
COPY cron-example /etc/cron.d/
RUN chmod 0644 /etc/cron.d/cron-example
# supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
