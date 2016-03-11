# docker-kibana
Docker image for kibana

## Build

    git clone https://github.com/skylost/docker-kibana.git
    docker build -t skylost/kibana .

## Run

    docker run -d -p 5601:5601 --env ELASTICSEARCH_URL=172.10.22.0 --env ELASTICSEARCH_PORT=9200 -name kibana skylost/kibana 

## Usage
