FROM ubuntu:18.04

LABEL mantainer=arthur.souzamiranda@gmail.com

RUN apt-get update \
    && apt-get install -y fio

COPY . /app
WORKDIR /app

ENTRYPOINT ["bash", "/app/run.sh"]
