# Install dependencies only when needed
FROM node:16.13-alpine AS deps
RUN apk add supercronic
WORKDIR /app

RUN addgroup -g 1001 -S nodejs
RUN adduser -S cronjobtemplate -u 1001
USER cronjobtemplate
COPY crontab crontab
COPY *.js .
COPY dockerstart.sh dockerstart.sh

CMD ./dockerstart.sh
