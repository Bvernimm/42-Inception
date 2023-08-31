FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get install -y openssl

# nginx SSL
COPY tools/openssl.sh /tools/
RUN /tools/openssl.sh

# nginx config
RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d

# Start nginx
CMD ["nginx", "-g", "daemon off;"]