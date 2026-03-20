FROM ubuntu:22.04
RUN apt-get update && apt-get install -y curl
WORKDIR /app
RUN curl -o paycue -L https://github.com/UzStack/paycue/releases/download/v1.0.7/paycue-linux-amd64
RUN chmod +x ./paycue
RUN echo "APP_ID=${APP_ID}\nAPP_HASH=${APP_HASH}\nTG_PHONE=${TG_PHONE}\nSESSION_DIR=sessions\nREDIS_ADDR=${REDIS_ADDR}\nWORKERS=10\nWEBHOOK_URL=${WEBHOOK_URL}\nWATCH_ID=${WATCH_ID}\nPORT=10800\nDEBUG=false\nLIMIT=100" > .env
CMD ["./paycue"]
