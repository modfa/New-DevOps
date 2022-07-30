FROM centos
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
CMD /bin/bash

MAINTAINER  motog5plusmobile@gmail.com
RUN yum install -y httpd \
  zip \
  unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page281/limelight.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip limelight.zip
RUN cp -rvf limelight-html/* .
RUN rm -rf limelight-html limelight.zip
CMD ["usr/sbin/httpd"," -D"," FOREGROUND"]
EXPOSE 80
