FROM debian:stable

# ENVIRONMENT
RUN sed -ie 's|http://deb.debian.org/debian$|http://ftp.halifax.rwth-aachen.de/debian|' /etc/apt/sources.list.d/debian.sources
RUN apt update

# REQUIREMENTS
RUN	apt install -y udev && \
    rm /usr/lib/udev/rules.d/*

# SCANBD, SANED
RUN apt install -y scanbd
RUN cp /etc/sane.d/saned.conf /etc/scanbd/
RUN echo "net" > /etc/sane.d/dll.conf && \
    sed -i 's|# connect_timeout|connect_timeout|' /etc/sane.d/net.conf && \
    sed -i 's|# localhost|localhost|' /etc/sane.d/net.conf

ADD ./scanbd /etc/scanbd/
ADD 99-scanbd.rules /usr/lib/udev/rules.d/

# WORKER    
RUN apt install -y parallel \
    			   task-spooler \
    			   imagemagick \
    			   ghostscript \
    			   tesseract-ocr \
    			   tesseract-ocr-eng \
    			   tesseract-ocr-deu \
    			   tesseract-ocr-pol

ADD ./script /script
RUN chmod +x /script/*.script
    			       
VOLUME /dest
VOLUME /work

ADD ./run.sh /
RUN chmod +x /run.sh
CMD /run.sh