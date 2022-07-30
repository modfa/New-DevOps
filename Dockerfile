FROM ubuntu
MAINTAINER  motog5plusmobile@gmail.com
RUN apt install update
ARG DEBIAN_FRONTEND=noninteractive 
RUN apt-get install -y apache2 && apt-get clean \
  zip \
  unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page281/limelight.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip limelight.zip
RUN cp -rvf limelight-html/* .
RUN rm -rf limelight-html limelight.zip
EXPOSE 80
CMD apachectl -D FOREGROUND
