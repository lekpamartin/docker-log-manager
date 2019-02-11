# docker-log-manager

## Deployment 

### Filebeat

```bash
docker run -d \
  --name=filebeat \
  --user=root \
  --volume="/var/lib/docker/containers:/var/lib/docker/containers:ro" \
  --volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
  lekpamartin/filebeat-docker:latest filebeat -e -strict.perms=false \
  -E output.elasticsearch.hosts=["elasticsearch:9200"]
```

### Logstash

## Configuration

### [Docker] HTTPD / Apache

```bash
docker run \
  --label co.elastic.logs/module=apache2 \
  --label co.elastic.logs/fileset.stdout=access \
  --label co.elastic.logs/fileset.stderr=error \
  --label co.elastic.metrics/module=apache \
  --label co.elastic.metrics/metricsets=status \
  --label co.elastic.metrics/hosts='${data.host}:${data.port}' \
  --detach=true \
  --name my-apache-app \
  -p 8080:80 \
  httpd:2.4
```

### syslog-ng

```bash
destination d_logstash_tcp_over_tls {
	tcp("${data.host}"
		port(${data.port})
		tls(
			ca-dir("/etc/syslog-ng/conf.d/ssl/ca.d")
			key_file("/etc/syslog-ng/conf.d/ssl/server-key.pem")
			cert_file("/etc/syslog-ng/conf.d/ssl/server-cert.pem")
		)
	);
};
```
