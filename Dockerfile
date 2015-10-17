###############################################################################
#Source: https://hub.docker.com/r/johnhatfield/play1/~/dockerfile/
##############################################################################
FROM debian:jessie

WORKDIR /tmp
RUN useradd -m play
RUN apt-get update &&\
    apt-get install -y python openjdk-7-jre wget unzip &&\
    wget -q http://downloads.typesafe.com/play/1.2.7/play-1.2.7.zip &&\
    unzip -q play-1.2.7.zip &&\
    mv play-1.2.7 /opt/play &&\
    rm play-1.2.7.zip &&\
    chown -R play /opt/play &&\
    chgrp -R play /opt/play &&\
    apt-get remove -y wget unzip &&\
    apt-get autoremove -y &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ENV PATH "$PATH:/opt/play"
WORKDIR /home/play
ADD . Helloworld

EXPOSE 9000
CMD play run Helloworld
