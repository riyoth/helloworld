###############################################################################
#Source: https://hub.docker.com/r/johnhatfield/play1/~/dockerfile/
##############################################################################
FROM java:7

WORKDIR /tmp
RUN apt-get update
RUN apt-get install -y unzip wget make mercurial git bzr libsqlite3-dev sqlite3
RUN wget -q http://downloads.typesafe.com/play/1.2.7/play-1.2.7.zip
RUN unzip -q play-1.2.7.zip
RUN mv play-1.2.7 /opt/play
RUN rm play-1.2.7.zip

RUN apt-get install -y python

RUN useradd -m play
RUN chown -R play /opt/play
RUN chgrp -R play /opt/play
ENV PATH "$PATH:/opt/play"
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /home/play

EXPOSE 9000
