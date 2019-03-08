FROM debian:stretch-slim

RUN apt-get update && apt-get install -y nginx vim nano python curl \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && pip install mkdocs

COPY nginx.conf /etc/nginx/nginx.conf
ADD sites-enabled /etc/nginx/sites-enabled

RUN export LC_ALL=C.UTF-8 \
    && export LANG=C.UTF-8

WORKDIR /var/www/html/naturmedicus

EXPOSE 80
EXPOSE 443

CMD ["nginx"]
