FROM docker.zyxr.com/tjk/centos:7
MAINTAINER fanghongbo

RUN yum -y install gcc gcc-c++ make automake autoconf libtool pcre* zlib openssl openssl-devel

ADD nginx-1.18.0.tar.gz /opt/
COPY docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN cd /opt/nginx-1.18.0/ && ./configure && make && make install

WORKDIR /usr/local/nginx/
COPY nginx.conf /usr/local/nginx/conf/
RUN mkdir /usr/local/nginx/conf/vhost/
COPY default.conf /usr/local/nginx/conf/vhost/

EXPOSE 80
EXPOSE 443

CMD [""]
ENTRYPOINT ["docker-entrypoint.sh"]
