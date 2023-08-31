mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/bvernimm.pem \
        -keyout /etc/nginx/ssl/bvernimm.key \
        -subj "/C=BE/ST=Bruxelles/L=Bruxelles/O=42 School/OU=bvernimm/CN=bvernimm/"