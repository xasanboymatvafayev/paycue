FROM ubuntu:22.04
RUN apt-get update && apt-get install -y curl
WORKDIR /app
RUN curl -o paycue -L https://github.com/UzStack/paycue/releases/download/v1.0.7/paycue-linux-amd64
RUN chmod +x ./paycue
CMD echo "APP_ID=${APP_ID}" > .env && \
    echo "APP_HASH=${APP_HASH}" >> .env && \
    echo "TG_PHONE=${TG_PHONE}" >> .env && \
    echo "SESSION_DIR=sessions" >> .env && \
    echo "REDIS_ADDR=${REDIS_ADDR}" >> .env && \
    echo "WORKERS=10" >> .env && \
    echo "WEBHOOK_URL=${WEBHOOK_URL}" >> .env && \
    echo "WATCH_ID=${WATCH_ID}" >> .env && \
    echo "PORT=10800" >> .env && \
    echo "DEBUG=false" >> .env && \
    echo "LIMIT=100" >> .env && \
    echo "${TG_PHONE}" | ./paycue --telegram
