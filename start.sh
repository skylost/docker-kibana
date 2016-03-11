#!/bin/bash

docker run -d -p 5601:5601 \
           --env ELASTICSEARCH_URL=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' elastic) \
           --name kibana weezhard/kibana
