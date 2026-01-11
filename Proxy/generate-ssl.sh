#!/bin/bash
# Generate self-signed SSL certificate for development

mkdir -p ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ssl/server.key \
  -out ssl/server.crt \
  -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=Ft_transcendence/CN=localhost"

echo "SSL certificates generated in ./ssl/"
