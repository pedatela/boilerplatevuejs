FROM node:lts-alpine as build-stage
ENV JQ_VERSION=1.6
RUN wget --no-check-certificate https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 -O /tmp/jq-linux64
RUN cp /tmp/jq-linux64 /usr/bin/jq
RUN chmod +x /usr/bin/jq

WORKDIR /app
COPY . .
RUN jq 'to_entries | map_values({ (.key) : ("$" + .key) }) | reduce .[] as $item ({}; . + $item)' ./src/config.json > ./src/config.tmp.json 
RUN mv ./src/config.tmp.json ./src/config.json
RUN npm install && npm run build

FROM nginx:1.17
COPY ./nginx.conf /etc/nginx/nginx.conf
ENV JSFOLDER=/usr/share/nginx/html/js/*.js
COPY ./start-nginx.sh /usr/bin/start-nginx.sh
RUN chmod +x /usr/bin/start-nginx.sh
RUN rm -rf /usr/share/nginx/html/*
WORKDIR /usr/share/nginx/html
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
ENTRYPOINT [ "start-nginx.sh" ]
