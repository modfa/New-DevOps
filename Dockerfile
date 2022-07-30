FROM ubuntu

MAINTAINER  motog5plusmobile@gmail.com
RUN apt install update
RUN apt install -y apache2 \
  zip \
  unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page281/limelight.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip limelight.zip
RUN cp -rvf limelight-html/* .
RUN rm -rf limelight-html limelight.zip
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
EXPOSE 80
