```
docker run \
	--name glances \
	--rm \
	-v /var/run/docker.sock:/var/run/docker.sock:ro \
	-t robertbeal/glances
```

```
docker create \
	--name=glances \
	-p 61208:61208 -p 61209:61209 \
        -v /home/glances:/config \
	-v /var/run/docker.sock:/var/run/docker.sock:ro \
	-t robertbeal/glances --export-influxdb --config /config/glances.conf

docker start -i glances
```
