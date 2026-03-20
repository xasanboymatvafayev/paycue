FROM ubuntu:22.04
RUN apt-get update && apt-get install -y curl
WORKDIR /app
RUN curl -o paycue -L https://github.com/UzStack/paycue/releases/download/v1.0.7/paycue-linux-amd64
RUN chmod +x ./paycue
COPY .env .env
CMD ["./paycue"]