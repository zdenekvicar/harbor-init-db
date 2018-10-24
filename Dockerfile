FROM alpine:3.8

# install required packages
RUN apk add --no-cache postgresql-client

# prepare init SQL scripts
RUN mkdir /harbor-init-scripts/
COPY initial-notaryserver.sql /harbor-init-scripts/ 
COPY initial-notarysigner.sql /harbor-init-scripts/
COPY initial-registry.sql /harbor-init-scripts/
COPY initial-clair.sql /harbor-init-scripts/

# prepare init shell script
ADD run.sh /

ENTRYPOINT [ "/run.sh" ]