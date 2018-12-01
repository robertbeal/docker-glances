FROM arm32v6/alpine:latest

RUN apk add --no-cache \
    python3 \
    py-psutil \
    iputils \
  
  && python3 -m pip install \
    glances[bottle,influxdb] \
    bottle \
    influxdb \
  && rm -rf /tmp/*

RUN addgroup -S glances && adduser -h /data -G glances -S glances
WORKDIR /data
RUN chown glances:glances .

USER glances
EXPOSE 61208 61209
ENTRYPOINT ["python3", "-m", "glances"]

