# Usage: FROM [image name]
FROM debian

# Usage: MAINTAINER [name]
MAINTAINER weezhard

# Variables
ENV KIBANA_VERSION 4.4.2

ENV ELASTICSEARCH_URL localhost
ENV ELASTICSEARCH_PORT 9200


# Install wget
RUN apt-get update && \
    apt-get install -y -q wget

# Install kibana
RUN wget -q https://download.elastic.co/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz -O /opt/kibana.tar.gz && \
    cd /opt && tar -xzvf kibana.tar.gz && \
    mv /opt/kibana-$KIBANA_VERSION-linux-x64 /opt/kibana

# Clean apt
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /opt/kibana.tar.gz

# Adduser kibana
RUN useradd kibana
RUN chown -R kibana:kibana /opt/kibana


COPY conf/kibana.yml /opt/kibana/config/kibana.yml
COPY conf/kibana-entrypoint /opt/kibana/kibana-entrypoint

# Expose and Startup
EXPOSE 5601

ENTRYPOINT ["/opt/kibana/kibana-entrypoint"]
