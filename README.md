# docker-containers-log-manager
Automaticaly parse and send containers logs to Elasticsearch and visualise it in Kibana. 

## Deployment 

```bash
git clone https://github.com/lekpamartin/docker-log-manager.git
cd docker-log-manager
docker-compose up -d
```

## Containers Configuration

Add those labels in "docker run" or "docker-compose"

### Disable logs parsing
```bash
co.elastic.logs/disable=true
```

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
