run:
	echo "Starting Docker Container"

	docker run -d \
        --name=gus-dev \
        --net='host' \
        --privileged=true \
        -v _dev/config:/config \
        -v _dev/data:/data \
        -e USE_HDDTEMP=no \
        -e INFLUXDB_HTTP_PORT=8086 \
        -e INFLUXDB_RPC_PORT=58083 \
        -e LOKI_PORT=3100 \
        -e PROMTAIL_PORT=9086 \
        -e GRAFANA_PORT=3006 \
        -v /var/run/utmp:/var/run/utmp:ro \
        -v /var/run/docker.sock:/var/run/docker.sock:ro \
        -v /:/rootfs:ro \
        -v /run/udev:/run/udev:ro \
        -v /sys:/rootfs/sys:ro \
        -v /etc:/rootfs/etc:ro \
        -v /proc:/rootfs/proc:ro \
        -e HOST_PROC=/rootfs/proc \
        -e HOST_SYS=/rootfs/sys \
        -e HOST_ETC=/rootfs/etc \
        -e HOST_MOUNT_PREFIX=/rootfs \
        kieranholroyd/grafana-unraid-stack:<tag>