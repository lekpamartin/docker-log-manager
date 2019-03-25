# docker-containers-log-manager

## Deployment 

```bash
docker-compose up -d
```

## Containers Configuration

### HTTPD / Apache
Add label in you run 
```bash
docker run \
  --label co.elastic.logs/module=apache2 \
  --label co.elastic.logs/fileset.stdout=access \
  --label co.elastic.logs/fileset.stderr=error \
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
