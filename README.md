# docker-containers-log-manager

## Deployment 

```bash
docker-compose up -d
```

## Containers Configuration

Add those labels in docker run or docker-compose

### Apache / HTTPD
```bash
co.elastic.logs/module=apache2
co.elastic.logs/fileset.stdout=access
co.elastic.logs/fileset.stderr=error
```

### Nginx
```bash
co.elastic.logs/module=nginx
co.elastic.logs/fileset.stdout=access
co.elastic.logs/fileset.stderr=error
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
