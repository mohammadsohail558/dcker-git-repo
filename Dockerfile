#Image Specification
FROM ubuntu:18.04
#Install updates and Apache Server
RUN apt-get update -y
RUN apt-get install apache2 -y

#Add Source Code
RUN rm -rf /var/www/html
ADD src/index.html /var/www/html/

EXPOSE 80
