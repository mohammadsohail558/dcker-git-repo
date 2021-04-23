#Image Specification
FROM ubuntu:18.04

#Install dependencies
RUN apt-get update -y
RUN apt-get install apache2 -y

#Install App
RUN rm -rf /var/www/html
ADD src/index.html /var/www/html/

#configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
    echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
    echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \
    chmod 755 /root/run_apache.sh

EXPOSE 80

CMD /root/run_apache.sh
