FROM debian:stable-slim

MAINTAINER Paolo Perego paolo@codiceinsicuro.it


LABEL "it.codiceinsicuro" = "VulnUP Scanning script"
LABEL version="0.10"

RUN apt-get update
#RUN apt-get install apt-file
#RUN apt-file update
RUN apt-get install -yq nmap wget
RUN wget https://raw.githubusercontent.com/vulnersCom/nmap-vulners/master/vulners.nse -O /usr/share/nmap/scripts/vulners.nse
RUN echo '#!/bin/sh' > /usr/local/sbin/vulnup.sh
RUN echo 'nmap -sV --script vulners $1' >> /usr/local/sbin/vulnup.sh
RUN chmod ugo+x /usr/local/sbin/vulnup.sh


ENTRYPOINT ["/usr/local/sbin/vulnup.sh"]
