#!/bin/bash

#docker run -d -p 5601:5601 \
#           --env ELASTICSEARCH_URL=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' elastic) \
#           --name kibana weezhard/kibana

docker run -d --net elastic --ip 172.18.0.25 \
           --env ELASTICSEARCH_URL=$(docker inspect --format '{{ .NetworkSettings.Networks.elastic.IPAddress }}' elastic1) \
           --name kibana weezhard/kibana
